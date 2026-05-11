---
description: Run a timed mock contest against the local query set
---

Simulate a contest round to train the operator and measure end-to-end performance.

1. Confirm the system is up.
// turbo
```bash
curl http://localhost:8000/api/v1/health/ready
```

2. Pick the query set and number of questions.
// turbo
```bash
python scripts/mock_contest.py --queries data/queries/sample.json --pick 10 --shuffle
```

3. Run the contest. Operator drives the tool; the script logs every action.
```bash
python scripts/mock_contest.py \
  --queries data/queries/sample.json \
  --pick 10 \
  --shuffle \
  --budget-seconds 300 \
  --reveal-mode incremental \
  --log reports/mock_contest_$(Get-Date -Format yyyyMMdd_HHmm).jsonl
```

4. Inspect the per-query telemetry.
// turbo
```bash
python scripts/mock_contest.py --report reports/mock_contest_*.jsonl
```

5. Compare against the previous mock contest.
// turbo
```bash
python scripts/mock_contest.py --diff
```

6. Coach writes a 3-line retro into `progress.txt`.
