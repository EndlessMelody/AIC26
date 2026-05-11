# Risk Register

Living document. Update when a new risk surfaces or an existing risk changes likelihood / impact.

**Likelihood**: 1 (rare) → 5 (almost certain)
**Impact**: 1 (minor annoyance) → 5 (loses the contest)
**Score** = Likelihood × Impact. Triage anything ≥ 12.

## Active Risks

| ID | Category | Risk | L | I | Score | Mitigation | Owner |
|---|---|---|---|---|---|---|---|
| R-01 | Contest day | Submission server unreachable from contest hall network | 3 | 5 | **15** | Pre-event: validate connectivity 30 min before. Have a mobile hotspot as backup. Cache last-known endpoint URL locally. | Coach |
| R-02 | Contest day | Operator clicks wrong frame and submits before reviewing | 3 | 4 | **12** | Require confirm-on-Enter dialog for submissions; show video timeline preview. Add `Esc` to cancel within 2 s window. | Frontend |
| R-03 | Tech | FAISS index does not fit in RAM on contest laptop | 2 | 5 | **10** | Plan IVF-PQ fallback; measure peak memory during dry runs; alternate to memory-mapped Numpy if needed. | ML |
| R-04 | Tech | CLIP latency too high under stress (P95 > 200 ms) | 3 | 4 | **12** | Pre-encode common Vietnamese phrases; warm cache on startup; tune HNSW `efSearch`. | Backend |
| R-05 | Tech | Vietnamese OCR returns garbled text on news graphics | 4 | 3 | **12** | A/B test PaddleOCR vs EasyOCR; post-process with diacritic restoration; manually verify on training data. | ML |
| R-06 | Tech | LLM API rate-limit or outage during contest | 3 | 4 | **12** | Local Qwen2.5-7B fallback; cap concurrent LLM calls; degrade gracefully to pure retrieval. | Backend |
| R-07 | Tech | Disk full while ingesting Batch 3 (Sept 2026) | 3 | 4 | **12** | Provision ≥ 1 TB SSD; monitor with `df` cron; pre-compute embeddings → drop raw frames if necessary. | ML |
| R-08 | People | Primary operator unavailable on contest day (illness, transport) | 2 | 5 | **10** | Cross-train a secondary operator. Run mock contests with both. | Coach |
| R-09 | People | Engineer commits a breaking change the night before the round | 3 | 5 | **15** | Code freeze 24 h before each round. Require PR review for any change. Tag a `release/preliminary-round` branch. | Lead |
| R-10 | Data | BTC releases data with unexpected naming convention, breaks our pipeline | 3 | 4 | **12** | Build extractors against a Pydantic schema; surface mismatches loudly; have a `--remap` flag on every ingest script. | ML |
| R-11 | Data | OCR / ASR quality degrades on Batch 3 (different broadcaster, different style) | 3 | 3 | **9** | EDA on each batch within 4 h of release; tune confidence thresholds per batch. | ML |
| R-12 | Audit | Jury asks for replay and our logs are incomplete | 2 | 5 | **10** | Append every search + submission to `data/submissions.jsonl`. Build a "replay query" button in the UI from Phase 1. | Backend + Frontend |
| R-13 | Compliance | Accidental screenshot of Video-KIS clip leaks into our tool | 1 | 5 | **5** | Train operator; disable clipboard paste of images during contest; UI guardrail. | Coach |
| R-14 | Spec | BTC publishes the 2026 spec late, leaving little time to react | 3 | 4 | **12** | Keep architecture flexible. Maintain agent-layer roadmap in memory so it can be enabled fast. See ADR-003. | Lead |
| R-15 | Spec | The 2026 task requires RAG / Q&A that we have not planned for | 3 | 4 | **12** | See ADR-003 and "Agent/RAG Strategic Analysis" memory; tiered rollout plan documented. | Lead |
| R-16 | Performance | Browser freezes when rendering 10k thumbnails | 3 | 3 | **9** | Virtualise the result grid (`@tanstack/react-virtual`). Cap visible items per page. | Frontend |
| R-17 | Performance | GPU underutilised during indexing (small batches) | 4 | 2 | **8** | Tune `batch_size` per model; use `torch.compile` where stable; monitor `nvidia-smi`. | ML |
| R-18 | Security | API token for BTC submission server leaks via git | 2 | 5 | **10** | `.env` is gitignored; pre-commit hook scans for secrets (see `.pre-commit-config.yaml`). | Lead |
| R-19 | Process | Team forgets to register before 15/6/2026 | 1 | 5 | **5** | Calendar reminder T-30, T-7, T-1. Lead is responsible. | Lead |
| R-20 | UX | Operator misses a hot-key under stress | 4 | 2 | **8** | Print `artifacts/operator-cheatsheet.md` and tape it next to the keyboard. Drill it during every mock contest. | Operator + Coach |

## Retired Risks
*(none yet)*

## Risk Review Cadence

- **Weekly** during Phase 1-2 - lead reviews this table and updates likelihood / impact.
- **Daily** during preliminary and final rounds - coach checks top-5 risks each morning.
- After every mock contest - add any new failure mode observed.
