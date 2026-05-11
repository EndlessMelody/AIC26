# Tests (Placeholder)

Pytest test suite mirroring the `backend/` and `ml/` package layouts.

It is intentionally left as a placeholder for now - real tests will land in Phase 1
(see `docs/03-timeline-milestones.md`).

## Planned Layout

```
tests/
├── conftest.py              # shared fixtures (sample data, tmp index)
├── fixtures/                # tiny synthetic dataset (2-3 videos, ~10 keyframes)
├── ml/
│   ├── test_clip_extractor.py
│   ├── test_ocr.py
│   └── test_asr.py
├── backend/
│   ├── test_health.py
│   ├── test_search_text.py
│   └── test_submit.py
└── e2e/
    └── test_search_flow.py
```

## Conventions

- Run with: `pytest tests/`
- Mock heavy services (CLIP, FAISS) - never load real models in CI.
- Keep the synthetic fixture small enough that the full test suite runs in < 30 s.
