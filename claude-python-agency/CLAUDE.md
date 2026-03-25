# Project Context

## Stack

- Python 3.12+
- Strict type checking (mypy in strict mode)
- FastAPI for HTTP transport (or framework as specified)
- pydantic for validation and settings
- uv as package manager
- Ruff for formatting and linting (not flake8, not black, not isort)
- pytest for unit and integration tests

## Commands

```
uv run dev           # Start dev server
uv run mypy src/     # Type check (strict mode)
uv run ruff check    # Lint
uv run ruff check --fix  # Lint with autofix
uv run ruff format   # Format
uv run pytest        # Run tests
uv run pytest -m e2e # Run E2E tests
```

## Architecture Rules

1. **`src/<project>/` is the root package.** No logic at repository root. No flat scripts alongside `pyproject.toml`.
2. **Layer separation is enforced by import direction.**
   - `domain/` — types, protocols, invariants. Zero framework imports. Zero infrastructure imports.
   - `services/` — orchestration. Depends on domain. Calls ports, never concrete adapters.
   - `infra/` — adapters (DB, cache, HTTP clients, message brokers). Implements domain protocols.
   - `transport/` — API routes, CLI, workers. Thin: validate, delegate, serialize.
3. **Domain purity by default.** Framework imports in `transport/` and `infra/` only. Adding a framework import to `domain/` or `services/` requires architect approval.
4. **Protocols over ABCs.** Define integration boundaries in `domain/ports.py`. Concrete adapters in `infra/` implement these protocols.
5. **No wildcard imports.** Import from specific modules, not package `__init__.py` re-exports.
6. **Colocation.** Transport-specific helpers live adjacent to their route module (e.g., `transport/dashboard/_helpers.py`). Shared logic goes in `services/` or `domain/`.
7. **Types.** Full annotations on all public functions and methods. Shared types in `domain/types.py`. No `Any` without documented justification. No `type: ignore` without documented justification.
8. **Naming.** Files: `snake_case.py`. Classes: `PascalCase`. Constants: `UPPER_SNAKE`. Modules: `snake_case`.
9. **Imports.** Absolute from package root. Example: `from <project>.domain.types import UserId`, `from <project>.infra.db import PostgresAdapter`.

## Agent Protocol

### Agents

| Agent | Role | Authority | Model |
|---|---|---|---|
| @orchestrator | Routes tasks, synthesizes results | Read + Write + Agent delegation | Opus |
| @platform-architect | Structural design (packages, layers, boundaries, config) | Read-only | Opus |
| @integration-engineer | Adapters, APIs, transactions, mutation flows | Read-only | Sonnet |
| @feature-implementer | Bounded, approved implementation | Read + Write + Edit + Bash | Sonnet |
| @reviewer | Quality gate (correctness, boundary integrity) | Read-only + Bash(test) | Sonnet |

### Routing rules

- package structure / layer boundary / dependency direction / auth / config question → @platform-architect
- API handlers / adapters / external services / transactions / workers → @integration-engineer
- bounded approved implementation → @feature-implementer
- all non-trivial implementation → @reviewer before approval

### Commands

- `/do [task]` — Entry point. Orchestrator classifies and routes.
- `/architect [question]` — Direct to platform architect.
- `/integrate [question]` — Direct to integration engineer.
- `/implement [spec]` — Direct to feature implementer.
- `/review [scope]` — Direct to reviewer.

### Workflow discipline

1. Non-trivial tasks go through orchestrator (or explicit specialist command).
2. Architecture and integration design must be approved before implementation.
3. Non-trivial implementations require review before completion.
4. Orchestrator synthesizes — does not implement directly unless trivial.

## Verification

Every implementation must pass before merge:

1. `uv run mypy src/` — zero errors
2. `uv run ruff check` — zero errors
3. `uv run pytest` — all passing
