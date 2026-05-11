---
trigger: glob
globs: ["backend/**/*.py", "backend/**/*.toml"]
description: Rules for the FastAPI backend
---

# Backend API Rules (FastAPI)

## Stack

- **FastAPI** + **Uvicorn** (ASGI). One worker for GPU services; more workers for CPU-only services.
- **Pydantic v2** for schema validation + `pydantic-settings` for config.
- **Async-first**: `async def` for endpoints, `httpx.AsyncClient` for outbound HTTP.
- Dependency injection via `Depends()` and FastAPI's `lifespan` for shared resources.
- **WebSocket** for low-latency operator UI updates (live result streaming, submission status).

## Performance Targets

- **Search endpoint latency**: < 200 ms (P95) for top-k = 100 with HNSW.
- **Cold start**: load FAISS / Qdrant indices and CLIP text encoder during the `lifespan` startup event. The first user request must not wait for model load.
- **Batch endpoint** when the frontend needs more than one query at a time - avoid N round trips.
- **Streaming**: prefer `StreamingResponse` or SSE for LLM rerank, ASR, transcription.
- **WebSocket** for hot-path updates (< 50 ms server-to-client). Keep messages JSON, small, and versioned.

## Project Layout

```
backend/app/
├── api/                 # FastAPI routers grouped by resource
│   ├── health.py
│   ├── search.py        # POST /search/text, /search/image, /search/hybrid
│   ├── video.py         # GET /video/{id}, /video/{id}/keyframes
│   ├── submit.py        # POST /submit, GET /submit/history
│   └── ws.py            # WebSocket endpoints
├── core/                # config, logging, lifespan, errors
│   ├── config.py
│   ├── logging.py
│   ├── errors.py
│   └── lifespan.py
├── services/            # business logic, NO FastAPI imports here
│   ├── retrieval.py     # CLIP + FAISS + BM25 + RRF fusion
│   ├── rerank.py        # LLM / cross-encoder rerank
│   ├── llm.py           # provider-agnostic LLM client
│   └── submission.py    # talks to organiser's grading server
├── models/              # Pydantic Request/Response DTOs
│   ├── search.py
│   ├── submission.py
│   └── common.py
└── main.py              # app factory + lifespan wiring
```

## API Design

- **Versioned URLs**: `/api/v1/...`. Introduce `/v2` only when a breaking change ships; never break `v1` in place.
- **Deprecation**: when removing a `v1` endpoint, return `Sunset` + `Deprecation` headers for at least one release.
- Resource-oriented routes: `POST /api/v1/search/text`, `POST /api/v1/search/image`, `POST /api/v1/search/hybrid`, `POST /api/v1/submit`.
- Every endpoint returns a **typed Pydantic model**. Never return a raw dict. Never return `None` from a `200`.
- Status codes are explicit: `200`, `201`, `202`, `204`, `400`, `401`, `404`, `409`, `422`, `429`, `500`, `503`.
- **Error envelope**:
  ```json
  {
    "error_code": "SEARCH_INDEX_NOT_READY",
    "message": "...",
    "request_id": "<uuid>",
    "details": {}
  }
  ```
  Define stable `error_code` strings in `core/errors.py` so the frontend can branch on them.
- **Pagination**: cursor-based for any list endpoint (`?cursor=<opaque>&limit=<int>`); default `limit=50`, max `200`.

## Idempotency

- Mutating endpoints (`/submit`) accept an `Idempotency-Key` header. The same key within 24 h returns the original response without re-submitting.
- Use a small SQLite or Redis store for keyed responses.

## Configuration

- `pydantic-settings.BaseSettings` reading from `.env` + environment.
- All paths, ports, model names, top-k values, latency budgets are configurable.
- One settings module: `backend/app/core/config.py`. Export a cached `get_settings()` (FastAPI dependency).
- Forbid raw `os.getenv` outside `config.py`.

## Security

- CORS: open only to the configured frontend origin via env var. Never `*` in production.
- Trust the `X-Request-ID` header only after validating it as a UUID; otherwise generate a new one.
- Validate every input via Pydantic (length limits, regex for IDs, max array sizes).
- Rate-limit `/submit` to a sane rate (e.g. 60 req/min per client) using `slowapi`.
- Never log secrets (API keys, tokens). Mask them in error messages.
- Reject request bodies larger than 10 MB (`MAX_REQUEST_BYTES`) at the middleware level.

## Observability

- **Structured logging** with `loguru`, JSON sink in production. Every log line carries `request_id`, `endpoint`, `latency_ms`, `status`.
- **Metrics**: expose `/metrics` (Prometheus) with at least `http_request_duration_seconds`, `search_top_k_latency_seconds`, `index_size`, `llm_calls_total`.
- **Tracing**: optional OpenTelemetry with the FastAPI instrumentor; export to stdout in dev, OTLP in prod.
- **Health probes**:
  - `GET /api/v1/health/live` - returns 200 if the process is alive.
  - `GET /api/v1/health/ready` - returns 200 only when the index is loaded and at least one search can complete.

## Lifespan, Startup & Shutdown

- Use FastAPI's `lifespan` async context manager. Load models and indices on enter; release on exit.
- Handle SIGINT / SIGTERM by waiting up to 30 s for in-flight requests (`uvicorn` does this when configured with `--timeout-graceful-shutdown 30`).
- Run a startup self-check: encode a dummy query and assert it returns a result, otherwise mark `not ready`.

## Streaming & WebSocket

- LLM rerank with > 1 s tail latency: stream partial results via SSE (`StreamingResponse`).
- Live operator UI updates: WebSocket at `/api/v1/ws/operator`. Messages versioned: `{ "v": 1, "type": "result_chunk", "payload": ... }`.
- Auth via short-lived tokens passed as a `Sec-WebSocket-Protocol` header.

## Caching

- LRU cache for repeated query strings (in-memory). Bounded by `LRU_QUERY_CACHE_SIZE` env (default 2,048).
- Keyframe thumbnails served via `StaticFiles` with strong `Cache-Control: public, max-age=31536000, immutable` - filenames include a content hash.
- Redis is optional; only add it when single-process cache is provably insufficient.

## Submission to Organiser

- All outbound calls to the BTC submission server go through `services/submission.py`.
- **Retry policy**: exponential backoff + jitter, max 3 attempts, total budget < 8 s (contest queries are < 5 min, every second counts).
- Log every submission: `query_id`, `submitted_at`, `status`, `response_body`, `latency_ms`.
- Persist every submission to `data/submissions.jsonl` (append-only) so we can audit after the round.

## Testing

- `pytest` + `httpx.AsyncClient` for endpoint tests.
- Mock heavy services (CLIP encoder, FAISS) with fast in-memory fakes; do not load real models in CI.
- Fixtures for a small synthetic dataset under `tests/fixtures/`.
- Contract tests: a `pytest` test asserts the OpenAPI schema matches a checked-in snapshot - prevents silent breakage for the frontend.
- WebSocket tests with `httpx_ws` or `websockets`.
