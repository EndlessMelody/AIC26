---
description: Build CLIP / SigLIP embeddings for all keyframes
---

Encode every keyframe with the chosen vision-language model and persist vectors.

1. Pick the model and dimension (defaults to OpenCLIP ViT-L/14).
// turbo
```bash
python scripts/build_clip_index.py --print-config
```

2. Dry run on a small subset to validate.
```bash
python scripts/build_clip_index.py \
  --model open_clip:ViT-L-14/laion2b_s32b_b82k \
  --keyframes data/keyframes \
  --output data/index/clip_vit_l14 \
  --batch-size 64 \
  --limit 200
```

3. Full extraction (heavy - ALWAYS confirm with user before running).
```bash
python scripts/build_clip_index.py \
  --model open_clip:ViT-L-14/laion2b_s32b_b82k \
  --keyframes data/keyframes \
  --output data/index/clip_vit_l14 \
  --batch-size 256 \
  --fp16 \
  --resume
```

4. Build the FAISS index (HNSW for fast ANN search).
```bash
python scripts/build_clip_index.py \
  --build-faiss \
  --embeddings data/index/clip_vit_l14/embeddings.npy \
  --output data/index/clip_vit_l14/hnsw.faiss \
  --metric ip \
  --hnsw-m 32 \
  --ef-construction 200
```

5. Run a sanity-check query.
// turbo
```bash
python scripts/build_clip_index.py --query "a red car on the street" --top-k 10
```
