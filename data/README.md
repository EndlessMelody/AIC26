# Data

This folder is **gitignored** (except for `.gitkeep` markers and small files under `queries/`).

It will hold the multimedia dataset and derived artefacts. See `docs/02-data-spec.md` for the full specification of every subfolder and file format.

## Subfolders

| Subfolder    | Contents                                                                                                                                      |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `raw/`       | Source MP4 videos provided by the organizers                                                                                                  |
| `keyframes/` | Extracted JPG keyframes, one folder per video                                                                                                 |
| `metadata/`  | OCR, ASR, object detections, captions (Parquet files)                                                                                         |
| `index/`     | FAISS / Qdrant indices and BM25 stores                                                                                                        |
| `queries/`   | Sample and official query files (small, may be committed)                                                                                     |
| `models/`    | HuggingFace and OpenCLIP model cache (HF_HOME points here) - auto-created on first model download; NOT tracked in git (no `.gitkeep` needed). |

## Storage Budget

Plan for **at least 1 TB of fast SSD** for the full ~300 h dataset. See `docs/02-data-spec.md` for sizing.
