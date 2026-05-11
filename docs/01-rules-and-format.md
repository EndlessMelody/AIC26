# Rules & Format

The authoritative ruleset lives at <https://aichallenge.hochiminhcity.gov.vn/en/huong-dan>. This file is a working summary derived from the 2022 and 2024 editions of the rulebook and will be updated when the 2026 spec is published.

## Round 1 - Preliminary
- **Format**: pure **Textual KIS**.
- **Data scope**: the first two data batches (~200 hours in 2022; expected similar for 2026).
- The full query description is given at once.
- Each team submits results from their **own tool** (judges may audit).
- A short methodology blurb is required alongside each submission.

### Scoring
- Each query has a fixed max score (e.g. 100).
- The score decreases with the number of wrong attempts and the time taken.
- Top teams advance to the final.

## Round 2 - Final
- **Format**: **Textual KIS** + **Video KIS**.
- **Data scope**: all released data (~300 hours of video + metadata in 2022).
- Live event in a single hall (with rare remote-participation exceptions).
- For each query the judge progressively reveals clues. Teams may submit at any time.
- **Wrong submissions reduce the maximum possible score** for that query.
- The earlier you submit a correct answer, the higher the points.

### Time mechanics
- Each query has a fixed time budget (typical: 5 minutes).
- Submitting at T seconds after the start scores roughly `max_score * (1 - T / budget)`, minus penalties.
- Multiple wrong submissions compound the penalty.

## Submission Format (template, to be confirmed for 2026)
```json
{
  "query_id": "Q01",
  "team_id": "<your team id>",
  "submitted_at": "2026-09-15T10:23:11.456+07:00",
  "results": [
    {
      "rank": 1,
      "video_id": "L01_V001",
      "frame_idx": 12450,
      "timestamp_ms": 415000
    }
  ],
  "method_note": "CLIP ViT-L/14 + BM25 over ASR + LLM rerank"
}
```

Both `frame_idx` (keyframe index inside the official keyframe set) and `timestamp_ms` (milliseconds into the source video) are typically required. Trust the official spec when released.

## Allowed & Forbidden
| Allowed | Forbidden |
|---|---|
| Using BTC-provided metadata (CLIP features, objects, descriptions) | Recording or screenshotting Video KIS clips |
| Computing your own features from raw video / audio | Submitting results not produced by your own tool |
| External pretrained models (CLIP, Whisper, LLMs, ...) | Hardcoded query → answer mappings |
| Online APIs (OpenAI, Gemini, ...) - usually allowed; verify with BTC | Manual offline lookup that bypasses the tool |

## Tooling Requirements
- The tool runs on the team's own hardware.
- Internet access during the contest is typically allowed (verify per-edition).
- Submissions are sent to an organizer-controlled HTTP endpoint.
- Submission format and endpoint are announced shortly before the contest.

## Audit
The jury may ask a team to demonstrate that a result was indeed produced by their tool. Be prepared to replay any query end-to-end live.
