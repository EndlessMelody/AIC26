# AI Challenge 2026 - convenience targets.
# Run `make help` to see what is available.
# Cross-platform note: on Windows, prefer `nmake` or run targets manually
# in PowerShell; this Makefile is primarily for Linux / macOS / WSL.

.PHONY: help install install-frontend dev backend frontend test lint format clean \
        ingest embed mock-contest profile-latency precommit-install

help:
	@echo "Common targets:"
	@echo "  make install            - install Python deps (pyproject.toml [dev])"
	@echo "  make install-frontend   - npm install inside frontend/"
	@echo "  make dev                - start backend + frontend together"
	@echo "  make backend            - start FastAPI backend only"
	@echo "  make frontend           - start Next.js frontend only"
	@echo "  make test               - run pytest"
	@echo "  make lint               - ruff + black --check"
	@echo "  make format             - ruff --fix + black"
	@echo "  make precommit-install  - install pre-commit hooks"
	@echo "  make ingest             - run the full ingest pipeline (HEAVY)"
	@echo "  make embed              - build CLIP embeddings + FAISS index"
	@echo "  make mock-contest       - run a timed mock contest"
	@echo "  make profile-latency    - measure P50/P95 search latency"
	@echo "  make clean              - remove caches and build artefacts"

install:
	pip install -e .[dev]

install-frontend:
	npm install --prefix frontend

dev:
	@echo "Run backend and frontend in two terminals:"
	@echo "  1) uvicorn backend.app.main:app --reload --port 8000"
	@echo "  2) npm run dev --prefix frontend"

backend:
	uvicorn backend.app.main:app --reload --host 0.0.0.0 --port 8000

frontend:
	npm run dev --prefix frontend

test:
	pytest tests/ -ra

lint:
	ruff check .
	black --check .

format:
	ruff check . --fix
	black .

precommit-install:
	pre-commit install

ingest:
	python scripts/ingest.py --check
	@echo "Confirm with the team before running the full pipeline."

embed:
	python scripts/build_clip_index.py --full

mock-contest:
	python scripts/mock_contest.py --queries data/queries/sample.json --pick 10 --shuffle

profile-latency:
	python scripts/profile_latency.py --queries data/queries/sample.json --n 200

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache __pycache__ \
	       backend/**/__pycache__ ml/**/__pycache__ tests/**/__pycache__ \
	       frontend/.next frontend/out
