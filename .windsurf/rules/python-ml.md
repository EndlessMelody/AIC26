---
trigger: glob
globs: ["**/*.py", "**/*.ipynb", "ml/**", "scripts/**", "backend/**"]
description: Rules for Python code and ML pipelines
---

# Python & ML Rules

## Runtime & Environment

- **Python 3.11** (aligned with most common GPU cluster images; some ML libs lag on 3.12+).
- Dependency management: prefer `uv`, fall back to `pip` + `pyproject.toml`.
- CUDA 12.x with PyTorch 2.x. Always check `torch.cuda.is_available()` before assuming a GPU.
- For mixed CPU/GPU code, accept a `device: str | torch.device` parameter; never read it from globals.

## Code Style

- **Type hints are mandatory** on every public function. Use modern syntax (`list[int]`, `dict[str, Any]`, `X | None`).
- Format with `ruff` + `black`. Line length: 100.
- Google-style docstrings on every public API (`Args`, `Returns`, `Raises`, `Example`).
- `from __future__ import annotations` at the top of every file.
- Prefer `pathlib.Path` over `os.path`. Prefer `dataclasses` (or Pydantic) over dict-of-dicts.
- No `print` in library code. Use `loguru` with structured kwargs: `logger.info("encoded batch", n=batch.size, latency_ms=ms)`.

## Project Structure

- One responsibility per module. Files should rarely exceed 400 lines - refactor when they do.
- A subpackage exposes a stable surface through `__init__.py` (barrel). Internal helpers live in private modules (`_helpers.py`).
- CLI scripts in `scripts/` are thin wrappers around library functions in `ml/` - never put logic in scripts.

## Determinism & Reproducibility

- Set seeds at the top of every script:
  ```python
  import random, numpy as np, torch
  random.seed(42); np.random.seed(42); torch.manual_seed(42); torch.cuda.manual_seed_all(42)
  ```
- For full determinism on GPU: `torch.use_deterministic_algorithms(True)` and `CUBLAS_WORKSPACE_CONFIG=:4096:8` (accept slower).
- Capture the exact config used for every artefact (model hash, code commit, random seed, hyperparams) into the artefact's `manifest.json`.
- Version every produced artefact: `clip_vit_l14_v3.npy` not `clip.npy`.

## ML Best Practices

- **Batch processing**: use `DataLoader` with `num_workers > 0`, `pin_memory=True`, `persistent_workers=True` for extraction.
- **Mixed precision** (`torch.cuda.amp.autocast`) for inference on large models. Combine with `torch.bfloat16` on Ampere+ GPUs.
- **No-grad context**: wrap extraction in `with torch.inference_mode():`.
- **GPU memory**: call `torch.cuda.empty_cache()` between large batches; `del` tensors no longer needed; use `torch.cuda.memory_summary()` to debug OOM.
- **Gradient accumulation** if effective batch size is constrained by memory.
- **NaN / Inf check**: every loss tensor and every embedding batch must be checked with `torch.isfinite(x).all()`; abort the job loudly on failure.
- **Tensor shape checks**: assert shapes at function boundaries - or use `einops.rearrange` which forces shape contracts.

## Multiprocessing & Concurrency

- Use `multiprocessing.get_context("spawn")` on Windows; `"fork"` is unsafe with PyTorch.
- Heavy I/O (downloads, OCR) → `concurrent.futures.ProcessPoolExecutor`. Heavy GPU → single process, batch larger.
- Async-friendly libraries (`httpx`, `aiofiles`) for network-bound work in the backend.

## Model Loading

- Cache HuggingFace models in `data/models/` (set `HF_HOME=./data/models/huggingface`).
- Keep large model weights out of git (already covered by `.gitignore`).
- Lazy load: instantiate models only when first needed; never at module import time.
- Pin model revisions: `from_pretrained("name", revision="<sha>")` whenever possible - prevents silent upstream changes.

## Data Validation

- Use **Pydantic v2** models for any structured config / metadata loaded from disk.
- Use **pandera** (or a custom schema check) for Parquet / DataFrame I/O - validate dtypes, ranges, nullability on load and on save.
- Reject silently bad inputs at the boundary, not deep inside the pipeline.

## Checkpointing & Recovery

- Any extraction job longer than 5 minutes must support resume (see `general.md` rules on idempotency).
- Checkpoint format: JSONL or Parquet recording the list of `processed_ids`.
- Before processing an item, check whether it is already in the checkpoint → skip if so.
- Write checkpoints **atomically** (tmp + rename) so a crash mid-flush cannot corrupt them.

## Vector Embeddings

- Store embeddings as `numpy.memmap` or `.npy` for fast loading.
- For columnar workflows: Parquet with a `vector` column (`list<float32>`).
- Naming: `{model_name}_{dim}.npy`, e.g. `clip_vit_l14_768.npy`.
- Always ship a `manifest.json` next to it with: model name, model revision, dim, ordered `item_ids`, L2-normalisation flag, dtype, created_at, code commit.
- Normalise vectors at write time so retrieval can use plain inner product without per-query normalisation.

## FAISS / ANN Conventions

- Default index: HNSW with `M=32`, `efConstruction=200`, `efSearch=64` - tune `efSearch` per latency budget.
- Always serialise `ids.json` (ordered keyframe IDs) next to the FAISS file.
- Re-index from scratch if the embedding manifest changes (do not patch).

## Profiling

- For wall-clock hot paths: `cProfile` + `snakeviz` or `py-spy record`.
- For line-level slowness: `line_profiler` (`kernprof -l -v script.py`).
- For PyTorch: `torch.profiler` with `record_shapes=True`, view in TensorBoard.
- For memory leaks: `tracemalloc` + `objgraph`.
- Profile **before** optimising. Don't guess.

## Experiment Tracking (optional but encouraged)

- For non-trivial experiments, log to **MLflow** or **Weights & Biases**:
  - Params: model, hyperparams, dataset hash.
  - Metrics: Recall@k, MRR, latency_ms (p50, p95).
  - Artifacts: example queries, failure cases.
- Local fallback: append a row to `reports/experiments.csv` with the same columns.

## Notebooks

- First cell sets up imports, paths, and `%load_ext autoreload` + `%autoreload 2`.
- Do not commit large cell outputs (clear before committing; configure `nbstripout` if available).
- Notebooks are for **experimentation only**. Once a flow is stable, refactor into `ml/` and `scripts/`.
- Name notebooks `NN-topic.ipynb` (`01-eda-data.ipynb`, ...) so the order is obvious.

## Testing

- Mark expensive tests with `@pytest.mark.slow` and exclude them from the default suite.
- Use `pytest.fixture` with a tiny synthetic dataset (2-3 videos, ~10 keyframes) under `tests/fixtures/`.
- Mock external services (LLM APIs, BTC submission server) with `respx` or `pytest-httpx`.
- Snapshot tests for prompt output structure (JSON schema).
