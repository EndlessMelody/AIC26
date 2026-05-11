# Glossary

Shared vocabulary for the team. When in doubt, link to this file rather than re-explaining.

## Contest Terms (VBS / LSC heritage)

- **KIS** - *Known-Item Search*. The contestant must locate one specific target item described by the jury. The core task of AI Challenge HCMC.
- **Textual KIS** - KIS where the description is given in natural language (Vietnamese, in our case).
- **Visual KIS** / **Video KIS** - KIS where the cue is a short video clip (≤ 20 s for AI Challenge final).
- **AVS** - *Ad-hoc Video Search*. Open-ended retrieval task (multiple correct results) - usually NOT in AI Challenge, but common in TRECVID and VBS.
- **Q&A** - *Question & Answering* over the multimedia corpus. May appear as a sub-task in 2026.
- **T2V** / **V2T** - *Text-to-Video* / *Video-to-Text* retrieval directions.
- **Incremental description** - in the final round, the textual description is revealed gradually. Teams may submit early (high points if correct) or wait for more clues.
- **Submission server** / **Grading server** - the BTC HTTP endpoint that receives our submission and replies correct / incorrect.
- **Audit / Replay** - jury asks a team to live-replay how they obtained a result. Required for high-scoring teams.

## Retrieval Concepts

- **Dense retrieval** - search by L2 / cosine similarity on continuous embeddings (e.g. CLIP).
- **Sparse retrieval** - search by term-matching (BM25, TF-IDF) over text.
- **Hybrid retrieval** - combine dense + sparse, often via RRF (Reciprocal Rank Fusion).
- **RRF** - *Reciprocal Rank Fusion*. Combine two ranked lists into one. `score(i) = Σ 1 / (k + rank_j(i))` for each ranker j.
- **MMR** - *Maximal Marginal Relevance*. Diversify a result list by penalising near-duplicates.
- **ANN** - *Approximate Nearest Neighbour*. Trade exactness for speed (FAISS, HNSW, ScaNN).
- **HNSW** - *Hierarchical Navigable Small World*. The default ANN structure we use.
- **IVF-PQ** - *Inverted File + Product Quantization*. FAISS index type for huge corpora; smaller memory, slower at top-k.
- **Reranking** - a second-stage scorer (cross-encoder or LLM) refines the top-k from a fast first stage.
- **Late interaction** (e.g. ColBERT) - score each query token against each document token; powerful but expensive.

## Evaluation Metrics

- **Recall@k** - fraction of queries where the gold item appears in the top k results. We target Recall@10 first.
- **MRR** - *Mean Reciprocal Rank*. `mean(1 / rank_of_gold)`. Rewards putting the gold item high.
- **nDCG** - *Normalised Discounted Cumulative Gain*. Used when there are graded relevance labels (rare in KIS).
- **P95 latency** - 95th-percentile end-to-end query time. Target < 200 ms for fast path.
- **First-try accuracy** - fraction of contest queries solved without any wrong submission. The single most important score driver.

## Models & Architectures

- **CLIP** - OpenAI's contrastive image-text encoder. ViT-B/16 is the BTC-provided variant; we plan to use ViT-L/14.
- **OpenCLIP** - open re-implementation of CLIP with stronger checkpoints (laion2b, datacomp).
- **SigLIP** - sigmoid-loss alternative to CLIP; often beats CLIP on retrieval.
- **BLIP-2** - vision-language model for captioning + VQA.
- **LLaVA-OneVision** - multi-modal LLM that understands images and short videos.
- **Faster R-CNN** - object detector used by BTC on Open Images V4 (600 classes).
- **YOLOv10** / **Grounding DINO** - object detectors (closed and open-vocabulary).
- **PhoWhisper** - VinAI's Whisper fine-tuned for Vietnamese ASR.
- **PaddleOCR** - multilingual OCR with strong Vietnamese support.

## Data Artefacts

- **Keyframe** - a representative frame extracted from a video. The atomic searchable unit.
- **Shot** / **Scene** - a contiguous segment of video. A keyframe usually represents one shot.
- **Embedding** / **Feature vector** - the L2-normalised vector representation of a keyframe or query.
- **Manifest** - the JSON file that documents the provenance of any produced artefact (model, dim, hash, ids).
- **Concept** - an object class label produced by detection (one of 600 in Open Images V4 for BTC features).

## Operator / Contest Terms

- **Operator** - the person physically driving the tool during the contest. Primary scoring agent.
- **Coach** - the team member who reads the query aloud, manages time, and decides when to submit.
- **Fast path** vs **Smart path** - low-latency direct retrieval vs LLM-augmented retrieval (see `docs/05-references-papers.md` and Agent/RAG memory).
- **Replay query** - re-run a past query inside our tool, used for self-audit and jury audit.
- **Submission window** - the time budget for one query (typical: 5 minutes).

## Project Conventions

- **Phase 0 / 1 / 2 / ...** - internal milestones (see `docs/03-timeline-milestones.md`).
- **BTC** - *Ban Tổ Chức* (organizer / organising committee).
- **ADR** - *Architecture Decision Record* (see `docs/decisions/`).
- **Workspace language** - English for files, Vietnamese in chat with the user.

## Acronyms

| Acronym | Expansion |
|---|---|
| BTC | Ban Tổ Chức (organising committee) |
| VBS | Video Browser Showdown |
| LSC | Lifelog Search Challenge |
| KIS | Known-Item Search |
| AVS | Ad-hoc Video Search |
| MMR | Maximal Marginal Relevance |
| MRR | Mean Reciprocal Rank |
| ANN | Approximate Nearest Neighbour |
| HNSW | Hierarchical Navigable Small World |
| RRF | Reciprocal Rank Fusion |
| OCR | Optical Character Recognition |
| ASR | Automatic Speech Recognition |
| VQA | Visual Question Answering |
| RAG | Retrieval-Augmented Generation |
| ADR | Architecture Decision Record |
| SSE | Server-Sent Events |
