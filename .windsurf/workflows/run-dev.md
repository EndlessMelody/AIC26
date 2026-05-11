---
description: Start the dev environment - backend + frontend together
---

Start both servers for local development. The backend serves API on :8000, the frontend on :3000.

1. Activate the Python environment.
// turbo
```bash
python -m venv .venv
.venv\Scripts\activate
```

2. Install backend dependencies (first time only).
```bash
pip install -e .[dev]
```

3. Start the backend in one terminal.
```bash
uvicorn backend.app.main:app --reload --host 0.0.0.0 --port 8000
```

4. Install frontend dependencies (first time only).
```bash
npm install --prefix frontend
```

5. Start the frontend in another terminal.
```bash
npm run dev --prefix frontend
```

6. Open the UI.
// turbo
```bash
start http://localhost:3000
```

7. Health check.
// turbo
```bash
curl http://localhost:8000/api/v1/health
```
