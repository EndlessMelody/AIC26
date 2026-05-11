---
year: 2024
round: final
query_id: 2024-FINAL-Q01
type: textual-kis
difficulty: hard
mode: incremental-reveal
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese) - revealed in 3 chunks during the final round

**Chunk 1 (t=0s):**
> Một sự kiện công nghệ.

**Chunk 2 (t=30s):**
> Có CEO mặc áo đen đứng nói trước màn hình lớn.

**Chunk 3 (t=60s):**
> Phía sau có logo một công ty Việt Nam, sự kiện diễn ra ở TP.HCM.

# Strategy
- **Do NOT submit on chunk 1** - too generic, will lose points on wrong submission.
- **At chunk 2**: dense search "CEO speaking in front of large screen, tech event"; surface top-30.
- **At chunk 3**: add OCR filter for known Vietnamese tech company names; re-rank.
- **Decision rule**: submit only if confidence > 0.85 AND visual matches "CEO at podium, large screen, Vietnamese company logo".

# Notes
- Incremental queries reward patience.
- Operator should physically resist clicking submit until clue 2 lands.
