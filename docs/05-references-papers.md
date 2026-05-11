# References - Papers, Talks, and Past Systems

A curated list. Read these in order if you are new to interactive video retrieval.

## Annotated Key Readings (read these first)

### 1. Lokoč et al. - "Interactive Video Retrieval Evaluation at a Distance" (MMM 2021)

- **Why we care**: this is THE paper that defines the VBS evaluation format the AI Challenge inherits.
- **Take-away for us**: scoring rewards speed AND first-try accuracy; visible top-k size matters a lot.
- **Action**: read sections on scoring rules and operator behaviour.

### 2. AI Challenge 2024 retrospective papers (Springer / SOICT 2024)

- **"Event Retrieval from Large Video Collection in HCMC AI Challenge 2024"** - <https://link.springer.com/chapter/10.1007/978-981-96-4291-5_1>
- **"News Event Retrieval from Large Video Collection in HCMC"** (ACM SOICT 2024) - <https://dl.acm.org/doi/10.1145/3628797.3628940>
- **Why we care**: written by past contestants describing what worked on the exact corpus we will receive.
- **Take-aways to watch for**:
  - Hybrid CLIP + BM25 + object filters is the default winning recipe.
  - Vietnamese OCR quality is a frequent bottleneck.
  - UI virtualisation and keyboard shortcuts decide the contest, not raw recall.
- **Action**: skim during Phase 0, deep-read during Phase 2 (pre-training).

### 3. "LLM-powered video search: a comprehensive multimedia retrieval system" (Xuan et al., SOICT 2024)

- **Why we care**: first published AI Challenge entry that integrates an LLM for query rewriting and rerank. Foreshadows the 2026 theme.
- **Take-aways**: LLM is used for _augmentation_, not as the primary search path; fast retrieval still runs underneath.
- **Action**: read in Phase 1 when designing T1 (LLM query rewrite) layer.

### 4. "Real-Time Multi-user Multimedia Event Retrieval Application System Using WebSocket Protocol" (2025)

- **Why we care**: explicit use of WebSocket for live operator UI updates - influences our backend architecture.
- **Take-aways**: server pushes partial results to the operator as they stream from the retrieval pipeline, instead of waiting for the full top-k.
- **Action**: reference when implementing the WebSocket endpoint per `backend-api.md`.

### 5. Radford et al. - CLIP (ICML 2021) AND Zhai et al. - SigLIP (2023)

- **Why we care**: the embedding model is the heart of the system; choosing well moves Recall@10 by 5-10 points.
- **Take-aways**: SigLIP often beats CLIP on retrieval at the same parameter count; consider both for the production index.
- **Action**: benchmark both on `data/queries/sample.json` once data is available.

---

## Must-read: Format of the Contest

1. **Video Browser Showdown (VBS)** - <https://videobrowsershowdown.org/>
   - Lokoč et al. "Interactive Video Retrieval Evaluation at a Distance: Comparing Sixteen Interactive Video Search Systems in a Remote Setting at the 10th Video Browser Showdown" (MMM 2021).
2. **Lifelog Search Challenge (LSC)** - <http://lsc.dcu.ie/>
   - Gurrin et al. "An Introduction to the Third Edition of the Lifelog Search Challenge" (ICMR 2020).

## AI Challenge HCMC (the actual contest)

- "Event Retrieval from Large Video Collection in Ho Chi Minh City AI Challenge 2024" - <https://link.springer.com/chapter/10.1007/978-981-96-4291-5_1>
- "News Event Retrieval from Large Video Collection in Ho Chi Minh City" (SOICT 2024) - <https://dl.acm.org/doi/10.1145/3628797.3628940>
- "Real-Time Multi-user Multimedia Event Retrieval Application System Using WebSocket Protocol" (2025) - <https://doi.org/10.1007/978-981-96-4291-5_29>
- "LLM-powered video search: a comprehensive multimedia retrieval system" (Xuan et al., SOICT 2024).

## Foundation Models for Retrieval

- **CLIP** - Radford et al. "Learning Transferable Visual Models From Natural Language Supervision" (ICML 2021).
- **OpenCLIP** - Ilharco et al. "OpenCLIP". The de-facto open re-implementation.
- **SigLIP** - Zhai et al. "Sigmoid Loss for Language Image Pre-Training" (2023). Often beats CLIP on retrieval.
- **EVA-CLIP** - Fang et al. "EVA-CLIP" (2023). Strong scaling.
- **BLIP-2** - Li et al. "Bootstrapping Language-Image Pre-training" (ICML 2023). Captioning + QA.
- **LLaVA-OneVision** - Li et al. (2024). Unified vision-language understanding.

## Indexing & Retrieval

- **FAISS** - Johnson et al. "Billion-scale similarity search with GPUs" (TBD 2019).
- **HNSW** - Malkov & Yashunin. "Efficient and robust approximate nearest neighbor search using HNSW graphs" (PAMI 2018).
- **ColBERT / Late Interaction** - Khattab & Zaharia (SIGIR 2020) - useful if we add text rerank.
- **BM25** - Robertson & Zaragoza. Standard reference.

## Vietnamese NLP / ASR / OCR

- **PhoWhisper** - VinAI. ASR fine-tuned for Vietnamese.
- **PhoBERT / ViDeBERTa** - Vietnamese BERT models for text encoding.
- **PaddleOCR** - includes Vietnamese support; works best with image preprocessing.

## VBS-style Systems (UI & pipeline inspiration)

- **vitrivr** - Rossetto et al. (multi-modal retrieval engine).
- **diveXplore** - Schoeffmann et al.
- **VIRET** - Lokoč et al.
- **CVHunter** - Vesely et al.
- **V-FIRST** (HCMUS / VBS) - the local team's prior system, valuable to study.

## Talks & Slides

- VBS overview talks at MMM each year.
- LSC workshop at ICMR each year.

## Where to find papers

- arXiv, ACM Digital Library, SpringerLink.
- For Vietnamese-specific work: SOICT proceedings, JCSCE.

## How to Use This List

- During Phase 0 (foundations): skim all "Must-read" + at least 2 "AI Challenge HCMC" papers.
- During Phase 2 (pre-training): pick one VBS system that resembles ours and read its design in depth.
- During Phase 5 (final prep): re-read the scoring sections and any 2025 retrospective write-ups.
