---
year: 2024
round: preliminary
query_id: 2024-PRELIM-Q03
type: textual-kis
difficulty: medium
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese)
> Cầu thủ Việt Nam mặc áo đỏ ăn mừng bàn thắng trên sân, có cờ Việt Nam trên khán đài.

# Translation (English)
> A Vietnamese footballer in a red jersey celebrating a goal, with Vietnamese flags in the stands.

# Strategy
1. CLIP prompts: "Vietnamese football player celebrating goal, red jersey", "stadium crowd with Vietnam flags".
2. Object filter: `person`, `flag`.
3. Avoid OCR (player names rarely shown clearly).

# Notes
- The red jersey + Vietnam flag combination is very distinctive.
- Re-rank by counting flag bounding boxes in the frame.
