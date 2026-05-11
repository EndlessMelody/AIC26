# Timeline & Internal Milestones

External (organizer) milestones are fixed. Internal milestones are what **we** must hit to be competitive.

## Organizer Timeline
| Date | Event |
|---|---|
| ? - 15/6/2026 | Registration window |
| 6 - 7 / 2026 | Official training sessions |
| 8 / 2026 | Preliminary round |
| 9 - 10 / 2026 | Final round & ceremony |

## Internal Roadmap

### Phase 0 - Foundations (now → end of May 2026)
- [x] Workspace scaffolding (this repo)
- [ ] Read the latest VBS / LSC papers and 2024-2025 AI Challenge winning write-ups
- [ ] Each member runs the baseline notebooks end-to-end on a sample dataset
- [ ] Decide team roles (see `06-team-roles.md`)
- [ ] Local GPU machines configured (CUDA 12, Python 3.11, HF cache)

### Phase 1 - Baseline (June 2026)
- [ ] **Register** the team before 15/6
- [ ] Pipeline v0: keyframe extraction + CLIP ViT-B/16 + FAISS Flat
- [ ] FastAPI `/search/text` endpoint working
- [ ] Next.js minimal grid UI with one search bar
- [ ] End-to-end demo on synthetic test set
- [ ] Submission script (dry-run only) targeting placeholder format

### Phase 2 - Pre-training (July 2026)
- [ ] Attend organizer training sessions, capture every rule clarification
- [ ] Upgrade to OpenCLIP ViT-L/14 or SigLIP SO400M
- [ ] Add OCR (PaddleOCR VI) + ASR (PhoWhisper) extraction
- [ ] Hybrid retrieval: CLIP (dense) + BM25 over OCR/ASR (sparse) with reciprocal rank fusion
- [ ] LLM-assisted query rewrite (English ↔ Vietnamese, concept extraction)
- [ ] UI keyboard shortcuts MVP

### Phase 3 - Preliminary readiness (early August 2026)
- [ ] Process Batch 1 + Batch 2 data end-to-end the day each is released
- [ ] Local eval harness with mock queries; target Recall@10 > 0.7
- [ ] Failure-mode analysis: collect 50 hardest queries and improve
- [ ] Submission script connected to the official endpoint
- [ ] Two operators rehearsed on mock contests (timed)

### Phase 4 - Preliminary round (mid-late August 2026)
- [ ] Run the round; collect telemetry on every query
- [ ] Daily retro: which queries failed and why
- [ ] Patch issues without breaking prod

### Phase 5 - Final prep (September 2026)
- [ ] Re-ingest Batch 3 within 24h of release
- [ ] Add **Video KIS** strategy: temporal search, scene matching, "describe what you saw" flow in UI
- [ ] Speed pass: profile P95 latency, optimize hot paths (FAISS recall-vs-speed, prefetch thumbnails)
- [ ] Final UI polish: command palette, instant preview, latency badge
- [ ] Two full dress rehearsals against simulated live queries

### Phase 6 - Final round (late September - October 2026)
- [ ] Compete
- [ ] Submit retrospective write-up
- [ ] Open-source the system (post-event)

## Weekly Cadence
- **Monday**: plan the week, refresh `progress.txt`
- **Wednesday**: short integration sync
- **Friday**: demo + eval numbers

## Definition of Done per Milestone
A milestone is done when:
1. Code is merged on `main` with tests passing.
2. `progress.txt` is updated with the achievement.
3. A short demo (≤ 2 min) shows it working end-to-end.
