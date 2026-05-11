---
description: Measure P50 / P95 latency of the search pipeline
---

Profile the full retrieval stack and identify the slowest stage.

1. Backend must be running with the production index loaded.
// turbo
```bash
curl http://localhost:8000/api/v1/health/ready
```

2. Warm up the cache (encode a few common Vietnamese phrases).
// turbo
```bash
python scripts/profile_latency.py --warmup 20
```

3. Run the latency benchmark.
```bash
python scripts/profile_latency.py \
  --queries data/queries/sample.json \
  --n 200 \
  --concurrency 1 \
  --report reports/latency_$(Get-Date -Format yyyyMMdd_HHmm).json
```

4. Break the result down by stage (encode, search, rerank, total).
// turbo
```bash
python scripts/profile_latency.py --breakdown reports/latency_*.json
```

5. Run a stress test with concurrency = 4 to mimic a busy operator session.
```bash
python scripts/profile_latency.py --n 500 --concurrency 4
```

6. If P95 > 250 ms on the fast path, open the FAISS `efSearch` and CLIP batch size knobs.
