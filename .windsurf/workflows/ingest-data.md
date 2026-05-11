---
description: Full data ingestion pipeline - keyframes, OCR, ASR, objects, CLIP
---

Run the full pipeline from raw videos to a fully indexed multimodal store.
This is heavy; expect hours on a single GPU. ALWAYS confirm before running.

1. Pre-flight checks.
// turbo
```bash
python scripts/ingest.py --check
```

2. Stage 1 - keyframe extraction.
```bash
python scripts/extract_keyframes.py --input data/raw --output data/keyframes
```

3. Stage 2 - OCR (Vietnamese-aware).
```bash
python scripts/run_ocr.py \
  --keyframes data/keyframes \
  --output data/metadata/ocr.parquet \
  --engine paddleocr \
  --lang vi \
  --batch-size 16
```

4. Stage 3 - ASR (audio transcription).
```bash
python scripts/run_asr.py \
  --input data/raw \
  --output data/metadata/asr.parquet \
  --model phowhisper-large \
  --vad
```

5. Stage 4 - object detection (open-vocabulary).
```bash
python scripts/run_object_detection.py \
  --keyframes data/keyframes \
  --output data/metadata/objects.parquet \
  --model grounding-dino \
  --score-threshold 0.3
```

6. Stage 5 - CLIP embeddings + FAISS index.
```bash
python scripts/build_clip_index.py --full
```

7. Stage 6 - build BM25 index from OCR + ASR + descriptions.
```bash
python scripts/build_bm25_index.py \
  --inputs data/metadata/ocr.parquet data/metadata/asr.parquet \
  --output data/index/bm25
```

8. Stage 7 - smoke test the unified search.
// turbo
```bash
python scripts/eval_local.py --queries data/queries/sample.json --top-k 20
```
