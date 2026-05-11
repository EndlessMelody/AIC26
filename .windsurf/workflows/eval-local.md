---
description: Evaluate the retrieval system locally on a query set
---

Run the system against a JSON file of queries and report recall@k, MRR, and latency.

1. Make sure the index is built and the backend is running.
// turbo
```bash
curl http://localhost:8000/api/v1/health
```

2. Run evaluation on the sample query set.
```bash
python scripts/eval_local.py \
  --queries data/queries/sample.json \
  --top-k 100 \
  --report reports/eval_$(Get-Date -Format yyyyMMdd_HHmm).json
```

3. Compare against the last run.
// turbo
```bash
python scripts/eval_local.py --diff reports/eval_*.json
```

4. Inspect failure cases (queries with the worst rank of the gold frame).
// turbo
```bash
python scripts/eval_local.py --worst 20
```

5. Profile latency.
// turbo
```bash
python scripts/eval_local.py --profile-latency
```
