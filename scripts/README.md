# Scripts (Placeholder)

This folder will hold CLI entry points wired to the workflows in `.windsurf/workflows/`.

It is intentionally left as a placeholder for now - implementation will start in Phase 1
(see `docs/03-timeline-milestones.md`).

## Planned Scripts

| Script | Purpose | Used by workflow |
|---|---|---|
| `extract_keyframes.py` | Shot-boundary keyframe extraction | `/extract-keyframes` |
| `build_clip_index.py` | CLIP encoding + FAISS index | `/build-embeddings` |
| `run_ocr.py` | Vietnamese OCR over keyframes | `/ingest-data` |
| `run_asr.py` | Vietnamese ASR over audio | `/ingest-data` |
| `run_object_detection.py` | Object detection | `/ingest-data` |
| `build_bm25_index.py` | Sparse text index | `/ingest-data` |
| `ingest.py` | Orchestrates the full ingest | `/ingest-data` |
| `submit.py` | Submit a result to the BTC server | `/submit-result` |
| `eval_local.py` | Local eval (recall@k, MRR, latency) | `/eval-local` |
