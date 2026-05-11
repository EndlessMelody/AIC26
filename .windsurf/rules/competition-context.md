---
trigger: always_on
description: AI Challenge HCMC 2026 competition context - always applied
---

# AI Challenge 2026 - Fixed Context

## Competition Info

- **Name**: AI Challenge Ho Chi Minh City 2026 (Hội thi Thử thách Trí tuệ Nhân tạo TP.HCM 2026)
- **Division**: Group A - Youth / University Students
- **Theme**: Intelligent virtual assistant for in-depth analysis and retrieval of information from large-scale Multimedia data (images, audio, text, video).
- **Format**: Inherits from Video Browser Showdown (VBS) and Lifelog Search Challenge (LSC).
- **Website**: https://aichallenge.hochiminhcity.gov.vn

## Core Problem: Known-Item Search (KIS)

- **Textual KIS**: Find a target video/event from a Vietnamese textual description (preliminary: full description upfront; final: description revealed incrementally over time).
- **Video KIS**: Find a target video given a short clip ≤ 20 seconds (final round only; teams are **NOT allowed to record/screenshot** the clip into their tools).
- **NOT** a fully automated solution - the goal is an **interactive tool** that supports a human operator.

## Key Milestones

- **Registration**: until 15/6/2026
- **Training**: 6-7/2026
- **Preliminary round**: 8/2026
- **Final round & ceremony**: 9-10/2026

## Data Provided by Organizers (expected, based on previous years)

- News videos in MP4 (~300 hours released in 3 batches)
- Pre-extracted keyframes (JPG)
- CLIP features (ViT-B/16)
- Object concepts from Faster R-CNN trained on Open Images V4 (600 classes)
- Video descriptions (when available)

## Scoring Model (approximate, based on VBS 2022-2024)

- Each query has a fixed max score `S_max` (typically 100).
- Score for a correct submission at time `t` seconds into a `T`-second budget:
  `score = S_max * (1 - t/T) - penalty_per_wrong * wrong_count`
- Wrong submissions compound the penalty and waste time. **First-try accuracy is everything.**
- Submitting later but correctly beats submitting early but wrong.
- The exact 2026 formula will be announced. Always re-read the spec before each round.

## Coding & Suggestion Principles

1. **Query latency first** - the contest is timed; every second counts.
2. **First-try accuracy** - tune the system to surface the gold frame in the visible top-12. Operator latency + wrong-submission penalties dominate total score.
3. **Keyboard-first UI** - the operator must work without touching the mouse.
4. **Vietnamese language support** - OCR, ASR, query parsing must handle Vietnamese diacritics correctly.
5. **No hardcoded dataset paths** - read from env vars; data is delivered later by organizers.
6. **Modular pipeline** - each extractor (CLIP, OCR, ASR, objects) is independent and rerunnable.
7. **Persist intermediate results** - avoid re-extracting on 300h of video.
8. **Submission format** - strictly follow the format the organizers publish for result submission.
9. **Offline-resilient** - assume the contest hall network may flake; have a local-LLM fallback for query rewrite / rerank.
10. **Audit-ready** - every submission must be reproducible from the logged query + operator action.

## Query Result Format (reference VBS/LSC)

For each query, return: `video_id`, `frame_idx` or `timestamp_ms`, plus a ranked list. Final spec will be announced by organizers. See `artifacts/submission-format/` for the working schema.

## Audit Preparation

The jury may ask any team to **live-replay** how they obtained a result:

- Log every query, every shown result, every operator click, every submission with `request_id` and timestamps.
- Persist `data/submissions.jsonl` (append-only).
- Keep a "replay query" button in the UI that re-runs an exact past query and shows what the operator saw.
- Never patch the system mid-round; if a fix is critical, do it between queries with a coach's approval.

## Contest-Day Playbook

1. **30 min before**: index loaded, backend & frontend running, network to BTC server validated, dummy submission tested.
2. **5 min before**: operator does a final dry-run on a synthetic query; coach confirms shortcuts work.
3. **During each query**:
   - Coach reads the description aloud and watches the timer.
   - Operator drives the tool (search → grid → preview → submit).
   - Secondary operator takes notes on which strategy worked or failed.
   - Engineers stay silent unless coach asks for help.
4. **Between queries**: 10-15 s reset. Operator clears state, breathes, prepares for the next query.
5. **End of round**: dump telemetry, write a short retro in `progress.txt`.

## Common Operator Mistakes (memorise & avoid)

- Submitting too early on a noisy first guess - lose more points than you gain.
- Forgetting to clear filters between queries - previous OCR keyword still narrows results.
- Mis-reading the keyframe number (e.g. submitting `0042` instead of `0142` from the same video).
- Searching in English when the OCR is in Vietnamese - flip the mode in the UI.
- Hover-preview misleads on still scenes - always confirm with the video timeline before submitting.

## Anti-patterns Specific to This Contest

- **Hardcoding answers** for past queries - violates the rules and triggers disqualification if audited.
- **Recording the Video-KIS clip** - explicitly forbidden.
- **Sharing the tool / data with other teams** - violates the rules.
- **Using a result not produced by your own tool** - jury can ask for a replay and disqualify.
