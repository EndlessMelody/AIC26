---
description: Extract keyframes from raw videos using shot-boundary detection
---

Extract keyframes from `data/raw/` videos and save JPGs to `data/keyframes/<video_id>/`.

1. Verify the environment is ready.
// turbo
```bash
python -c "import torch; print('cuda', torch.cuda.is_available())"
```

2. List the videos to process.
// turbo
```bash
python scripts/extract_keyframes.py --list-only --input data/raw --output data/keyframes
```

3. Run the extraction with TransNetV2 (or PySceneDetect as fallback).
```bash
python scripts/extract_keyframes.py \
  --input data/raw \
  --output data/keyframes \
  --method transnetv2 \
  --min-shot-len 1.0 \
  --jpeg-quality 90 \
  --workers 4
```

4. Verify counts and write a manifest.
// turbo
```bash
python scripts/extract_keyframes.py --build-manifest --output data/keyframes
```

5. Inspect a sample to make sure quality is good.
// turbo
```bash
python scripts/extract_keyframes.py --sample 5 --output data/keyframes
```
