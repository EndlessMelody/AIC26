---
year: ${YEAR}
round: ${preliminary|final}
query_id: ${YEAR}-${ROUND}-Q${NN}
type: ${textual-kis|video-kis}
difficulty: ${easy|medium|hard}
gold:
  video_id: ${L01_V001}
  frame_idx: 0
  timestamp_ms: 0
---

# Query (Vietnamese)
> ${paste the Vietnamese description here}

# Translation (English)
> ${English translation here, preserving named entities}

# Strategy
1. CLIP prompts:
   - "${prompt 1 in concrete visual English}"
   - "${prompt 2 emphasising a different aspect}"
2. OCR / ASR filters: `${vi-keyword}`, `${other}`
3. Object filters: `${class1}`, `${class2}`
4. Other tools used: ${e.g. time-range, video filter}

# Notes
- ${one-line lesson learned}
- ${one-line failure mode to watch for}

# Time to solve (mock)
- ${e.g. 1m 30s with 0 wrong submissions}
