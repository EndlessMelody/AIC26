# Backend (Placeholder)

This folder will host the **FastAPI** server that exposes the retrieval and submission APIs.

It is intentionally left as a placeholder for now - implementation will start in Phase 1
(see `docs/03-timeline-milestones.md`).

## Planned Layout

```
backend/
└── app/
    ├── api/         # FastAPI routers grouped by resource (search, submit, video, health)
    ├── core/        # config, logging, lifespan, settings
    ├── services/    # business logic: retrieval, rerank, llm, submission
    ├── models/      # Pydantic schemas (Request/Response DTOs)
    └── main.py      # FastAPI app factory + lifespan
```

See `.windsurf/rules/backend-api.md` for the conventions to follow when this gets implemented.
