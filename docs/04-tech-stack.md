# Technology Stack

## Decision Summary

| Layer            | Choice                                                                      | Rationale                                                                      |
| ---------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Language         | Python 3.11 (ML / API), TypeScript (UI)                                     | Standard ML stack + modern web                                                 |
| Vision-language  | OpenCLIP ViT-L/14 (laion2b), SigLIP SO400M                                  | Strong zero-shot retrieval                                                     |
| Captioning       | BLIP-2, LLaVA-OneVision                                                     | Generate richer keyframe descriptions                                          |
| Object detection | YOLOv10 + Grounding DINO                                                    | Closed + open-vocab combo                                                      |
| OCR              | PaddleOCR (lang=vi), EasyOCR                                                | Best Vietnamese support                                                        |
| ASR              | PhoWhisper-large, Whisper large-v3                                          | Vietnamese diacritics handling                                                 |
| Sparse search    | BM25 (rank_bm25 or pyserini)                                                | Complement dense retrieval                                                     |
| Dense ANN        | FAISS HNSW (primary), Qdrant (backup)                                       | Sub-millisecond retrieval                                                      |
| LLM              | Qwen2.5-7B local + GPT-4o-mini API                                          | Query rewriting, reranking                                                     |
| Backend          | FastAPI + Uvicorn                                                           | Async, fast, Pythonic                                                          |
| Frontend         | Next.js 14 + **Once UI** (semantic layout + design tokens, dark-mode-first) | Vercel-/Linear-grade aesthetics, no utility-class noise, accessible-by-default |
| State            | TanStack Query + Zustand                                                    | Server + client state separation                                               |
| Vector cache     | Redis (optional)                                                            | Hot query cache                                                                |
| Container        | Docker + docker-compose                                                     | Reproducible deploy                                                            |
| Package mgr      | uv (Python), npm (Node)                                                     | Fast, modern                                                                   |

## Python Dependencies (high-level)

- **Core ML**: `torch`, `torchvision`, `transformers`, `accelerate`, `open_clip_torch`, `sentence-transformers`
- **Vision**: `opencv-python-headless`, `Pillow`, `decord`, `av` (video I/O)
- **Audio**: `librosa`, `soundfile`, `pyannote.audio` (VAD)
- **Retrieval**: `faiss-cpu` (or `faiss-gpu`), `qdrant-client`, `rank-bm25`, `pyserini`
- **OCR/ASR**: `paddleocr`, `easyocr`, `openai-whisper`, `faster-whisper`
- **API**: `fastapi`, `uvicorn[standard]`, `pydantic-settings`, `httpx`, `loguru`
- **Data**: `pandas`, `numpy`, `pyarrow`, `tqdm`
- **LLM clients**: `openai`, `google-generativeai`, `anthropic`
- **Test/Lint**: `pytest`, `pytest-asyncio`, `ruff`, `black`

## Node Dependencies (high-level)

- **Core**: `next@14`, `react@18`, `typescript@5`
- **UI**: `@once-ui-system/core` (the only design system), `lucide-react` (icons), `sass` (for the rare `.module.scss`)
- **State**: `@tanstack/react-query`, `zustand`
- **Virtualisation**: `@tanstack/react-virtual`
- **Forms / validation**: `react-hook-form`, `zod`
- **Test**: `vitest`, `@testing-library/react`, `@playwright/test`, `@axe-core/playwright`

### Banned on the frontend

- `tailwindcss`, `@radix-ui/*` (direct), `shadcn/ui`, `@mui/material`, `chakra-ui`, `mantine`.
- These conflict with Once UI's design-token model and add utility-class noise.

## Hardware Targets

- **Dev**: 1 workstation with NVIDIA RTX 4090 / 5090 (24-32 GB VRAM) per ML engineer.
- **Indexing**: ideally a server with > 64 GB RAM and 1 TB NVMe to hold full FAISS + keyframes.
- **Contest day**: laptop with the index pre-baked + stable network to the BTC submission server.

## Reference Implementations to Study

- **VBS systems**: vitrivr, diveXplore, VIRET, CVHunter, V-FIRST (HCMUS) - look at how they design the UI and indexing pipeline.
- **LSC**: Memento, MemoriEase - rich filter UI ideas.
- **AI Challenge 2024 winners**: see papers in `docs/05-references-papers.md`.

## Provider / API Decisions

- **OpenAI API**: used for query rewriting and final-stage rerank (gpt-4o-mini).
- **Local LLM (Qwen2.5)** as a fallback when network is unreliable in the contest hall.
- **HuggingFace Hub**: download models via `huggingface-cli` ahead of time; pre-warm the cache.

## Environment Variables (see `.env.example`)

- `DATA_ROOT` - root of the dataset
- `MODEL_CACHE_DIR` - HuggingFace + OpenCLIP cache
- `OPENAI_API_KEY` - optional
- `GOOGLE_API_KEY` - optional
- `AICHALLENGE_SUBMIT_URL` - organizer submission endpoint
- `AICHALLENGE_TEAM_TOKEN` - team auth token
