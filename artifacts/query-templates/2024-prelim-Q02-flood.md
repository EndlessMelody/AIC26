---
year: 2024
round: preliminary
query_id: 2024-PRELIM-Q02
type: textual-kis
difficulty: easy
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese)
> Cảnh đường phố bị ngập nước, có xe máy lội nước, mưa to.

# Translation (English)
> Flooded street scene with motorbikes wading through water during heavy rain.

# Strategy
1. CLIP prompt: "flooded city street with motorbikes wading through water, heavy rain".
2. Object filter: `motorcycle`, `umbrella`.
3. Top-30 dense, eyeball.

# Notes
- Strong visual signal; dense alone usually solves this.
- Beware of confusion between rainy-but-not-flooded and lightly-flooded scenes.
