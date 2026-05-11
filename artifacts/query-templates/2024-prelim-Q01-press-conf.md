---
year: 2024
round: preliminary
query_id: 2024-PRELIM-Q01
type: textual-kis
difficulty: medium
gold:
  video_id: PLACEHOLDER
  frame_idx: 0
---

# Query (Vietnamese)
> Một buổi họp báo của Bộ Y tế về dịch bệnh, người phát biểu đứng bục có logo Bộ Y tế phía sau.

# Translation (English)
> A Ministry of Health press conference about an epidemic; the speaker stands at a podium with the ministry's logo behind.

# Strategy
1. CLIP prompts: "press conference with Vietnamese ministry of health logo", "speaker at podium government event".
2. OCR filter: `Bộ Y tế`.
3. Top-50 dense -> rerank with `rerank-results.md`.

# Notes
- The logo is the strongest signal - OCR filter beats dense alone.
- Watch out for confusion with other ministry press conferences with similar backdrops.
