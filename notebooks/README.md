# Notebooks (Placeholder)

Jupyter notebooks for experimentation. Production code lives in `ml/` and `backend/`.

It is intentionally left as a placeholder for now - the first notebooks will land in Phase 1
(see `docs/03-timeline-milestones.md`).

## Planned Notebooks

| Notebook | Purpose |
|---|---|
| `01-eda-data.ipynb` | Explore the BTC dataset: counts, durations, sample frames |
| `02-clip-experiments.ipynb` | Try OpenCLIP / SigLIP / BLIP-2 on sample queries |
| `03-ocr-asr-pipeline.ipynb` | PaddleOCR + PhoWhisper quality checks on Vietnamese content |
| `04-retrieval-eval.ipynb` | Recall@k benchmarks; compare dense / sparse / hybrid |

## Conventions

- First cell: imports, paths, `%load_ext autoreload`.
- Clear outputs before committing (or run `nbstripout`).
- Move any reusable code out of notebooks into `ml/` once stable.
