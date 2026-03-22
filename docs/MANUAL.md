# ai bootstraps — Manual

Version 1.0  
Date: March 22, 2026

## 1. Purpose

Use this repository when you want a ready-made starting point for agentic workflows, either for:

- asynchronous Claude batch processing, or
- Next.js multiagent delivery with Claude or Codex operating profiles.

## 2. Which Bootstrap to Choose

1. Choose `claude-batch-bootstrap` for large async prompt workloads (evaluations, classification, extraction).
2. Choose `claude-nextjs-agency` for a runnable Next.js app scaffold with Claude-oriented multiagent governance.
3. Choose `codex-nextjs-agency-v1` when you want a simple specialist Codex setup.
4. Choose `codex-nextjs-agency-v2` when you want a richer functional workflow with skills and explicit verification/review stages.

## 3. Daily Usage

### 3.1 Claude Batch Flow

```bash
cd claude-batch-bootstrap
python -m venv .venv && source .venv/bin/activate
pip install anthropic
export ANTHROPIC_API_KEY="sk-ant-..."

python scripts/01_prepare_batch.py --input examples/input.jsonl --output batch_payload.json
python scripts/02_submit_batch.py --payload batch_payload.json
python scripts/03_poll_status.py
python scripts/04_fetch_results.py --output results.jsonl
```

Optional cancellation:

```bash
python scripts/05_cancel_batch.py --state batch_state.json
```

### 3.2 Claude Next.js Agency Flow

```bash
cd claude-nextjs-agency
pnpm install
pnpm typecheck
pnpm lint
pnpm test
pnpm dev
```

Bootstrap to a new project:

```bash
cd claude-nextjs-agency
./bootstrap.sh my-new-app
```

### 3.3 Codex Profile Setup

For either version, copy `.codex/` and `AGENTS.md` into your target Next.js repository root.

## 4. Operational Guidance

1. Keep template docs close to templates; use root docs for cross-template orientation.
2. Run verification commands inside each template before publishing changes.
3. If command names or workflow rules change, update docs in the same PR.
4. Treat each template as independent; avoid introducing root-level coupling unless intentionally migrating to a monorepo.

## 5. Troubleshooting

1. `ANTHROPIC_API_KEY` missing: export the key before running batch scripts.
2. `pnpm` missing: install pnpm before using Next.js templates.
3. Command mismatch in Claude bootstrap output: rely on files in `.claude/commands/` as source of truth.
4. Unexpected config behavior in Codex profiles: verify which version (`v1` vs `v2`) was copied.

## 6. Maintenance Checklist

On each material update:

1. Verify root directory map in `README.md`.
2. Verify root docs in `docs/`.
3. Verify each template still has accurate local docs.
4. Run at least one smoke command per affected template.
