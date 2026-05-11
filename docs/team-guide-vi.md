# Hướng Dẫn Sử Dụng Workspace - AI Challenge HCMC 2026

> **Lưu ý ngôn ngữ**: file này là **ngoại lệ** duy nhất được viết bằng tiếng Việt, mục đích để onboarding nhanh cho các thành viên team. Tất cả file khác trong workspace **bắt buộc tiếng Anh** theo `general.md`.

---

## 1. Workspace này là gì?

Đây là không gian làm việc của team cho cuộc thi **AI Challenge HCMC 2026** (Group A - Sinh viên). Hiện tại workspace đang ở **Phase 0 - Foundations**: tức là chỉ có rules, docs, workflows, và placeholders cho code. **Chưa có code production**.

Code thực sự sẽ bắt đầu được viết ở **Phase 1** (sau ngày đăng ký 15/6/2026).

### Workspace giúp được gì?

1. **Đồng bộ kiến thức** giữa các thành viên (mọi thông tin về cuộc thi, tech stack, quy tắc đều ở 1 chỗ).
2. **Đẩy nhanh tốc độ làm việc với Cascade** (Windsurf AI assistant) - Cascade đọc rules trong `.windsurf/rules/` và tự áp dụng đúng phong cách team.
3. **Sẵn sàng cho ngày thi**: có sẵn checklist, cheatsheet, risk register, contest-day playbook.
4. **Audit-ready**: nếu BTC yêu cầu replay 1 query, ta có logs + tools sẵn sàng.

---

## 2. Bắt đầu nhanh (Quick Start)

Khi bạn vừa clone repo lần đầu, hãy đọc theo thứ tự sau:

| Bước | File / Folder | Lý do |
|---|---|---|
| 1 | `@README.md` (root) | Tổng quan workspace - 2 phút |
| 2 | `@progress.txt` (đọc từ trên xuống) | Lịch sử các quyết định gần nhất |
| 3 | `@docs/minutes/00-kickoff.html` | Bức tranh tổng thể đẹp (mở bằng browser) |
| 4 | `@docs/README.md` | Index tất cả docs - biết doc nào ở đâu |
| 5 | `@docs/00-competition-overview.md` → `@docs/06-team-roles.md` | Đọc lần lượt 7 file numbered |
| 6 | `@docs/glossary.md` | Tra cứu thuật ngữ khi gặp từ lạ |
| 7 | `@.windsurf/rules/general.md` + `@.windsurf/rules/competition-context.md` | Quy tắc tổng quát |

Tổng thời gian: ~1-2 tiếng để đọc hết. Sau đó bạn đã sẵn sàng làm việc.

---

## 3. Cấu trúc folder - cái gì ở đâu, làm gì với nó

### 📁 `.windsurf/` - Cấu hình Cascade (Windsurf AI)

```
.windsurf/
├── rules/          (5 file rule - Cascade đọc khi sinh code)
└── workflows/      (9 file workflow - các "slash commands")
```

**Bạn làm gì với folder này?**

- **`.windsurf/rules/`**: 5 file `.md` đã được viết kỹ. Cascade tự đọc khi bạn code trong workspace. **Chỉ sửa khi đã thống nhất với team** (sửa rule = thay đổi cách Cascade code cho toàn team).
- **`.windsurf/workflows/`**: 9 workflow gọi qua slash command trong Cascade chat. Ví dụ gõ `/mock-contest` → Cascade chạy 1 buổi mock thi đấu. **Có thể thêm workflow mới**, chỉ cần copy template từ file có sẵn.

**Các rule hiện có:**

| File | Khi nào kích hoạt | Tóm tắt |
|---|---|---|
| `competition-context.md` | Luôn luôn | Context cuộc thi, scoring, audit, playbook ngày thi |
| `general.md` | Luôn luôn | English-only, conventional commits, idempotency, error envelope |
| `python-ml.md` | Khi sửa `*.py` | Determinism, profiling, FAISS conventions |
| `backend-api.md` | Khi sửa `backend/**` | FastAPI patterns, versioning, observability, WebSocket |
| `frontend-ui.md` | Khi sửa `frontend/**` | Once UI mandate, no Tailwind, keyboard-first UX |

**Các workflow hiện có:**

- **Pipeline dữ liệu**: `/extract-keyframes`, `/build-embeddings`, `/ingest-data`
- **Dev**: `/run-dev`, `/submit-result`, `/eval-local`
- **Sẵn sàng thi**: `/mock-contest`, `/profile-latency`, `/export-audit-snapshot`

---

### 📁 `docs/` - Knowledge base + ADRs + Minutes

```
docs/
├── 00-competition-overview.md       (đề bài là gì)
├── 01-rules-and-format.md           (luật chơi)
├── 02-data-spec.md                  (dữ liệu trông như thế nào)
├── 03-timeline-milestones.md        (mốc thời gian)
├── 04-tech-stack.md                 (stack tech)
├── 05-references-papers.md          (papers cần đọc)
├── 06-team-roles.md                 (ai làm gì)
├── glossary.md                      (từ điển thuật ngữ)
├── operator-manual.md               (sổ tay operator)
├── contest-day-checklist.md         (checklist ngày thi)
├── risk-register.md                 (sổ rủi ro)
├── team-guide-vi.md                 (file này - HD tiếng Việt)
├── decisions/                       (ADRs - quyết định kiến trúc)
└── minutes/                         (minutes các buổi họp)
```

**Bạn làm gì với folder này?**

- **Đọc**: đây là source of truth - mọi thông tin về cuộc thi, tech stack, người dùng nội bộ.
- **Cập nhật khi có thông tin mới**: ví dụ BTC công bố data mới → cập nhật `02-data-spec.md`. BTC công bố format submission → cập nhật `01-rules-and-format.md`.
- **Tạo ADR khi có quyết định kiến trúc**: copy template từ `decisions/README.md`, đánh số tiếp theo (ADR-004, ADR-005, ...).
- **Tạo minutes khi họp**: lưu vào `minutes/NN-topic.html` hoặc `.md`. Ví dụ `01-data-eda.md`, `02-baseline-results.html`.

**Quy tắc cập nhật docs:**

| Tình huống | Hành động |
|---|---|
| BTC công bố thông tin mới | Cập nhật doc liên quan + thêm dòng log vào `progress.txt` |
| Team họp ra quyết định kỹ thuật | Tạo ADR mới trong `decisions/` |
| Team họp định kỳ | Tạo file minutes mới trong `minutes/` |
| Phát hiện rủi ro mới | Thêm dòng vào `risk-register.md` (chấm L × I) |
| Sửa shortcut hoặc chiến thuật của operator | Cập nhật `operator-manual.md` + `artifacts/operator-cheatsheet.md` |

---

### 📁 `artifacts/` - Sản phẩm tái sử dụng

```
artifacts/
├── prompt-library/      (5 prompt LLM mẫu)
├── query-templates/     (8 query example + 1 blank)
├── submission-format/   (JSON Schema + CSV fallback)
└── operator-cheatsheet.md  (← IN RA dán bàn phím)
```

**Bạn làm gì với folder này?**

- **`prompt-library/`**: prompt templates cho LLM. Khi sửa prompt → test kỹ trước khi commit, vì 1 prompt sai = nhiều submission sai.
- **`query-templates/`**: các query mẫu để học cách phân tích. Khi gặp query mới khó → thêm vào folder này theo template `template-blank.md`.
- **`submission-format/`**: format BTC yêu cầu. **Đừng sửa schema** trừ khi BTC công bố format mới chính thức.
- **`operator-cheatsheet.md`**: **rất quan trọng**. Operator phải nhớ thuộc lòng. Trước ngày thi: in ra, dán bên bàn phím.

---

### 📁 `data/` - Dataset (gitignored)

```
data/
├── raw/         (video MP4 từ BTC - KHÔNG commit)
├── keyframes/   (JPG keyframes - KHÔNG commit)
├── metadata/    (Parquet OCR/ASR/objects - KHÔNG commit)
├── index/       (FAISS / Qdrant indices - KHÔNG commit)
├── models/      (HF cache - auto-tạo, KHÔNG commit)
└── queries/     (query files - file nhỏ, CÓ commit)
```

**Bạn làm gì với folder này?**

- **Không commit gì ngoài `queries/`**. `.gitignore` đã set sẵn.
- **Đường dẫn**: KHÔNG hardcode `D:\AI Challenge\data\...` trong code. Luôn đọc từ env var `DATA_ROOT` (xem `.env.example`).
- **Khi BTC release data**: tải về `data/raw/`, sau đó chạy `/extract-keyframes` → `/build-embeddings` → `/ingest-data`.
- **Khi mở rộng `queries/sample.json`**: thêm query mới với gold answers, commit bình thường.

**⚠️ KHÔNG XOÁ** file nào trong `data/` mà không xác nhận với team (quy tắc trong `general.md`).

---

### 📁 `backend/`, `frontend/`, `ml/`, `scripts/`, `notebooks/`, `tests/` - PLACEHOLDERS

```
backend/   ⏳ Sẽ code ở Phase 1 (FastAPI + Pydantic + WebSocket)
frontend/  ⏳ Sẽ code ở Phase 1 (Next.js 14 + Once UI)
ml/        ⏳ Sẽ code ở Phase 1 (CLIP, BM25, BLIP-2, ...)
scripts/   ⏳ Sẽ code ở Phase 1 (ingest, build_index, ...)
notebooks/ ⏳ Sẽ có khi cần EDA
tests/     ⏳ Sẽ có khi code Phase 1
```

**Bạn làm gì với các folder này?**

- **Hiện tại**: chỉ có README.md. Không động vào cho tới Phase 1.
- **Khi Phase 1 bắt đầu**: 
  - `backend/`: FastAPI app, theo `backend-api.md`.
  - `frontend/`: Next.js, theo `frontend-ui.md` (Once UI bắt buộc).
  - `ml/`: extractors (CLIP, OCR, ASR, objects), theo `python-ml.md`.
  - `scripts/`: CLI tools (ingest, embed, eval).
  - `notebooks/`: Jupyter cho EDA, KHÔNG commit output (đã có `nbstripout` trong pre-commit).
  - `tests/`: pytest, mỗi extractor có ít nhất 1 unit test.

---

### 📄 Files root - Cấu hình dự án

| File | Vai trò | Có nên sửa? |
|---|---|---|
| `README.md` | Welcome page của repo | Cập nhật khi cấu trúc lớn thay đổi |
| `progress.txt` | Log từng thay đổi (1 dòng / lần) | **Luôn cập nhật** khi có thay đổi user-visible |
| `pyproject.toml` | Python deps + config (ruff, black, pytest) | Sửa khi thêm dep |
| `Makefile` | Shortcut lệnh (`make install`, `make test`) | Sửa khi thêm task mới |
| `.pre-commit-config.yaml` | Hooks chạy trước mỗi commit | Sửa khi thêm linter mới |
| `.editorconfig` | Quy tắc encoding/indent cho mọi editor | **KHÔNG sửa** trừ khi thống nhất team |
| `.env.example` | Tài liệu các env var (không có giá trị thật) | Cập nhật khi thêm env var mới |
| `.gitignore` | Quy tắc git ignore | Sửa khi thêm folder cần ignore |

---

## 4. Workflow thường gặp

### 🔹 Khi bạn vào workspace lần đầu

1. Clone repo: `git clone https://github.com/EndlessMelody/AIC26.git`
2. Đọc theo Mục 2 (Quick Start).
3. (Sau Phase 1) Cài deps:
   ```powershell
   pip install -e .[dev]      # Python
   npm install --prefix frontend  # Frontend (sau khi scaffold)
   pre-commit install         # Git hooks
   ```

### 🔹 Khi sửa code (Phase 1+)

1. **Tạo branch**: `git checkout -b feat/<scope>-<description>`
2. **Viết code** theo rule của ngôn ngữ tương ứng (`python-ml.md` / `backend-api.md` / `frontend-ui.md`).
3. **Test local**: `pytest tests/` hoặc `npm test --prefix frontend`.
4. **Commit theo Conventional Commits**:
   - `feat(backend): add search endpoint`
   - `fix(ml): handle OOM in CLIP encode batch`
   - `perf(retrieval): swap to HNSW efSearch=64`
   - `docs(adr): add ADR-004 for vector DB choice`
   - Other prefixes: `chore`, `refactor`, `test`, `style`, `ci`, `build`
5. **Push + Pull Request** (nếu team dùng PR review).
6. **Cập nhật `progress.txt`** với 1 dòng tóm tắt.

### 🔹 Khi team có quyết định kiến trúc mới

1. Copy template trong `docs/decisions/README.md`.
2. Tạo file `docs/decisions/ADR-NNN-<title>.md`.
3. Thêm 1 dòng vào index trong `docs/decisions/README.md`.
4. Thêm 1 dòng log vào `progress.txt`.

### 🔹 Khi team họp

1. Tạo file `docs/minutes/NN-<topic>.md` hoặc `.html`.
2. Ghi: ngày, người tham dự, agenda, quyết định, action items.
3. Update progress.txt với 1 dòng: "Held meeting #NN on <topic>".

### 🔹 Khi BTC release dữ liệu mới

1. Tải về `data/raw/`.
2. Cập nhật `docs/02-data-spec.md` với thông tin mới (số video, format, size).
3. Chạy pipeline ingest:
   ```powershell
   # Gọi slash command trong Cascade chat:
   /extract-keyframes
   /build-embeddings
   /ingest-data
   ```
4. Sanity-check trong `notebooks/data-eda.ipynb`.

### 🔹 Khi chuẩn bị thi (gần ngày thi)

1. Đọc `docs/contest-day-checklist.md` từ đầu đến cuối.
2. In `artifacts/operator-cheatsheet.md` ra giấy.
3. Chạy `/mock-contest` ít nhất 1 lần / ngày trong tuần cuối.
4. Chạy `/profile-latency` để đo P95 < 250ms.
5. Code freeze 24h trước round.
6. Day-of: theo từng bước trong checklist.

### 🔹 Sau khi thi xong 1 round

1. Chạy `/export-audit-snapshot` ngay lập tức (lưu submissions + logs).
2. Lead viết retro 1 đoạn ngắn vào `progress.txt`.
3. Mỗi thành viên ghi 1 observation vào team chat.
4. Sáng hôm sau: review 5 failure modes lớn nhất.

---

## 5. Quy tắc cốt lõi (đọc kỹ, vi phạm = rollback)

### Ngôn ngữ
- ✅ **English-only** cho mọi file, code, comment, commit, filename.
- ❌ **Không tiếng Việt** trong workspace (trừ file này + content quotes như tên đề tài).
- ✅ Chat với Cascade và team có thể tiếng Việt.

### Git & Commits
- ✅ **Conventional Commits với scope**: `feat(backend): ...`, `perf(ml): ...`.
- ✅ **Branch naming**: `feat/...`, `fix/...`, `refactor/...`.
- ✅ **1 logical change per commit**.
- ❌ **Không commit `.env`**, model weights, dataset, kết quả notebook.
- ❌ **Không force-push** vào branch chính.

### Code Quality
- ✅ **Đọc file trước khi sửa** (rule trong `general.md`).
- ✅ **Type hints** trên mọi Python function.
- ✅ **Pydantic v2** cho mọi input/output API.
- ✅ **Pre-commit** chạy mỗi commit (sau `pre-commit install`).
- ❌ **Không dùng `print`** trong code production - dùng `loguru` hoặc stdlib `logging`.
- ❌ **Không hardcode** đường dẫn dataset - đọc từ env var.

### Decisions & Documentation
- ✅ **Mỗi quyết định lớn → ADR** trong `decisions/`.
- ✅ **Mỗi thay đổi user-visible → 1 dòng** trong `progress.txt`.
- ✅ **Mỗi feature mới → test** trong `tests/` (sau Phase 1).
- ❌ **Không xoá comments hoặc tests** mà không có lý do rõ ràng.

### Bảo mật & Dữ liệu
- ❌ **Không bao giờ** commit API key, token, password. Pre-commit có `gitleaks` để chặn.
- ❌ **Không xoá** bất cứ gì trong `data/` mà không xác nhận với team.
- ❌ **Không chạy** lệnh nặng (full ingest, full train) mà chưa xác nhận với team.

---

## 6. FAQ - Câu hỏi thường gặp

### Q: Cascade là gì? Tại sao có folder `.windsurf/`?

**A**: Cascade là AI coding assistant trong IDE Windsurf. Folder `.windsurf/rules/` chứa các quy tắc Cascade tự động đọc và áp dụng khi sinh code. Bạn có thể chat với Cascade bằng tiếng Việt; nó sẽ tự dịch yêu cầu và sinh code đúng style team.

### Q: Vì sao chọn Once UI, không phải Tailwind / shadcn?

**A**: Xem `@docs/decisions/ADR-001-once-ui-design-system.md`. Tóm tắt: Once UI có layout semantic (`<Column>`, `<Row>`), design token, dark-mode-first - phù hợp UI thi đấu. Tailwind tạo "class soup" khó maintain.

### Q: Vì sao team thi Group A?

**A**: Xem `@docs/decisions/ADR-002-compete-in-group-a.md`. Group A có scope lớn hơn (300h video) và sử dụng tech stack nâng cao - phù hợp với năng lực team.

### Q: Sao chưa làm RAG / Agent dù theme nói "trợ lý ảo"?

**A**: Xem `@docs/decisions/ADR-003-defer-agent-rag.md`. Tóm tắt: chúng ta đã có plan 4-tier (T0-T3) nhưng đợi BTC công bố đề chính thức (7-8/2026) mới quyết định triển khai. Kiến trúc retrieval engine vẫn là foundation cần build trước.

### Q: Khi nào bắt đầu code thực sự?

**A**: Sau ngày 15/6/2026 (deadline đăng ký) sẽ bắt đầu Phase 1. Trong Phase 1, ta build:
1. ML extractors (CLIP, OCR, ASR, objects)
2. Retrieval engine (FAISS + BM25 + RRF)
3. Backend API (FastAPI + WebSocket)
4. Frontend UI (Next.js + Once UI)
5. Local eval với `data/queries/sample.json`

### Q: Tôi muốn thêm dep Python mới, làm sao?

**A**:
1. Kiểm tra xem dep tương đương đã có trong `pyproject.toml` chưa.
2. Nếu cần thêm: edit `pyproject.toml`, pin version cụ thể.
3. Test: `pip install -e .[dev]` rồi `pytest`.
4. Commit: `build: add <package>==<version> for <reason>`.

### Q: Cascade gợi ý code không đúng quy tắc team, làm sao sửa?

**A**: Có thể rule chưa rõ ràng. Mở rule liên quan (`python-ml.md`, `backend-api.md`, ...) và bổ sung 1 dòng quy tắc mới. Lần sau Cascade sẽ tuân thủ.

### Q: Tôi quên 1 thuật ngữ (KIS, MRR, RRF, ...), tra ở đâu?

**A**: `@docs/glossary.md` - mọi thuật ngữ đều có ở đó.

### Q: Repo trên GitHub ở đâu?

**A**: <https://github.com/EndlessMelody/AIC26>

---

## 7. Cheat Sheet - Lệnh hay dùng

### Git
```powershell
# Lần đầu setup
git clone https://github.com/EndlessMelody/AIC26.git
cd "AI Challenge"
pre-commit install

# Commit theo Conventional Commits
git add <files>
git commit -m "feat(backend): add /search endpoint"
git push origin <branch>

# Đồng bộ với main
git fetch origin
git rebase origin/main

# Tạo branch mới
git checkout -b feat/clip-extractor
```

### Make (sau Phase 1)
```powershell
make install            # cài Python deps
make install-frontend   # cài frontend deps
make backend            # chạy FastAPI dev server
make frontend           # chạy Next.js dev server
make test               # chạy pytest
make lint               # chạy ruff + black --check
make format             # tự fix ruff + black
make mock-contest       # chạy mock thi đấu
make profile-latency    # đo P50/P95
```

### Cascade slash commands (gọi trong chat)
```
/extract-keyframes      → trích keyframes từ video
/build-embeddings       → build CLIP / SigLIP embeddings + FAISS
/ingest-data            → full pipeline (keyframes + OCR + ASR + objects + CLIP)
/run-dev                → khởi động backend + frontend
/eval-local             → eval trên query set
/mock-contest           → chạy mock thi đấu có bấm giờ
/profile-latency        → đo latency P50/P95
/submit-result          → format + submit kết quả lên grading server
/export-audit-snapshot  → bundle submissions + logs cho jury
```

### Pre-commit
```powershell
pre-commit install              # 1 lần sau khi clone
pre-commit run --all-files      # chạy tất cả hooks
pre-commit autoupdate           # update hook versions
```

---

## 8. Khi cần hỗ trợ

1. **Câu hỏi về cuộc thi**: đọc `@docs/00-competition-overview.md` và `@docs/01-rules-and-format.md`.
2. **Câu hỏi về tech stack**: đọc `@docs/04-tech-stack.md` và `@docs/minutes/00-kickoff.html`.
3. **Câu hỏi về vai trò team**: đọc `@docs/06-team-roles.md`.
4. **Bug / lỗi**: chat với Cascade trong IDE - mô tả bằng tiếng Việt cũng được.
5. **Quyết định kiến trúc**: thảo luận trong team chat → tạo ADR mới.

---

## 9. Roadmap tóm tắt

| Phase | Window | Mục tiêu |
|---|---|---|
| **Phase 0** | 5 / 2026 (HIỆN TẠI) | Foundations - workspace, rules, docs, plan |
| **Phase 1** | 6 / 2026 | Code baseline retrieval (CLIP + BM25 + FAISS) + UI minimum |
| **Phase 2** | 7 / 2026 | Hardening + Vietnamese OCR/ASR + Mock contests |
| **Phase 3** | 8 / 2026 | Preliminary round - chiến thi đấu sơ tuyển |
| **Phase 4** | 9 / 2026 | Final prep - Video KIS + LLM agent (nếu BTC yêu cầu RAG) |
| **Phase 5** | 10 / 2026 | Final round - thi chung kết |
| **Phase 6** | sau 10 / 2026 | Retrospective + open-source |

Chi tiết: `@docs/03-timeline-milestones.md`.

---

*File này được cập nhật lần cuối: 2026-05-11. Khi có thay đổi cấu trúc workspace lớn, vui lòng cập nhật file này luôn.*
