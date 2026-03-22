# ai bootstraps — Technical Specification

Version 1.0  
Date: March 22, 2026

## 1. Scope

This specification defines the structure and operating contracts of the `ai bootstraps` repository as a **template collection**. It does not define a single runtime application.

## 2. Repository Model

The repository is composed of independent bootstrap units:

- `claude-batch-bootstrap`: executable Python pipeline for Anthropic batch workloads.
- `claude-nextjs-agency`: executable Next.js template with Claude multiagent governance.
- `codex-nextjs-agency-v1`: Codex multiagent profile package (copy-in config).
- `codex-nextjs-agency-v2`: Codex multiagent profile package with skill system.

No root workspace manager (`pnpm-workspace.yaml`, root `package.json`) is present.

## 3. Module Contracts

### 3.1 `claude-batch-bootstrap`

- Runtime: Python 3.9+.
- External dependency: `anthropic` SDK.
- Pipeline scripts:
  1. `scripts/01_prepare_batch.py`
  2. `scripts/02_submit_batch.py`
  3. `scripts/03_poll_status.py`
  4. `scripts/04_fetch_results.py`
  5. `scripts/05_cancel_batch.py`
- State artifacts:
  - `batch_payload.json`
  - `batch_state.json`
  - `results.jsonl`
- Hard limits enforced at preparation:
  - max 100,000 requests
  - max 256 MB payload

### 3.2 `claude-nextjs-agency`

- Runtime: Node.js + pnpm.
- Framework stack: Next.js 15, React 19, TypeScript strict mode.
- Styling/UI: Tailwind CSS v4 + shadcn/ui.
- Quality tooling: Biome, Vitest, Playwright.
- Agent governance: `.claude/` with orchestrator + specialist roles.
- Permissions and safety hooks specified in `.claude/settings.json`.

### 3.3 `codex-nextjs-agency-v1`

- Configuration package for Codex agent routing.
- Contains:
  - `.codex/config.toml`
  - specialist agent definitions in `.codex/agents/*.toml`
  - `AGENTS.md` working agreement
- Focus: orchestrated specialist workflow with explicit architecture/integration/review phases.

### 3.4 `codex-nextjs-agency-v2`

- Configuration package for Codex functional workflow model.
- Contains:
  - `.codex/config.toml`
  - role agents: orchestrator, researcher, architect, integrator, implementer, verifier, reviewer
  - reusable skills in `.codex/skills/*/SKILL.md`
  - utility scaffold script `.codex/tools/create-skill.sh`
- Focus: minimal-sufficient function routing (`classify -> research -> design -> implement -> verify -> review -> document`).

## 4. Invariants

1. Each bootstrap directory must remain independently consumable.
2. Root documentation must reflect real directory names and commands.
3. Template-specific specs/manuals remain owned by each template.
4. Root docs provide cross-template orientation and selection guidance.

## 5. Known Issues / Drift

1. `claude-nextjs-agency/bootstrap.sh` prints `/plan` and `/build` commands, while current command files expose `/do`, `/architect`, `/integrate`, `/implement`, `/review`.
2. Legacy naming appeared in prior root README and has been replaced with current names in this version.

## 6. Change Management

When adding a new bootstrap track:

1. Create a top-level directory with self-contained docs.
2. Add or update template-local `SPEC`/`MANUAL` files.
3. Update root `README.md`, `docs/SPEC.md`, and `docs/MANUAL.md`.
4. Ensure quick start commands are executable from the template root.
