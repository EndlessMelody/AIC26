---
year: 2024
round: preliminary
query_id: Q-EXAMPLE
type: textual-kis
difficulty: medium
gold:
  video_id: L01_V012
  frame_idx: 12340
  timestamp_ms: 411333
---

# Query (Vietnamese)
> Buổi họp báo công bố sản phẩm mới của một công ty công nghệ, có logo màu xanh và một diễn giả nam mặc vest đen đang chỉ vào màn hình lớn.

# Translation (English)
> A press conference announcing a new product of a tech company, with a blue logo and a male speaker in a black suit pointing at a large screen.

# Strategy used
1. **Query rewrite** (`prompt-library/query-rewrite.md`) → CLIP prompts:
   - "Press conference with male speaker in black suit pointing at large screen"
   - "Tech company product launch with blue logo on stage"
2. **Filter** by OCR keyword: `họp báo` and `công bố`.
3. **Top-k = 50** dense → rerank with `rerank-results.md`.
4. Operator scanned the top 20 and submitted L01_V012 frame 12340.

# Failure modes observed
- Without the OCR filter, recall@10 was poor due to many similar press-conference frames.
- Wrong submission on a related but earlier frame in the same video - lesson: always check the speaker's gesture.

# Time to solve
- 1m 42s with one wrong submission, then correct.
