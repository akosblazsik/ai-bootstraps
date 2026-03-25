---
description: Core project conventions. Always active.
---

## Import Rules

- No wildcard imports (`from module import *`).
- No circular imports. If a cycle emerges, it signals a layer boundary violation.
- Import from specific modules, not package `__init__.py` re-exports.
- Domain layer imports nothing from transport, service, or infra layers.
- Use absolute imports from package root (`from <project>.domain.types import ...`).

## Module Rules

- Domain layer has zero framework imports. Pure Python and standard library only.
- Transport layer (routes, CLI, workers) is thin: validate, delegate, serialize.
- Infrastructure adapters implement protocols defined in `domain/ports.py`.
- Service layer depends on protocols, never on concrete adapters.

## Type Rules

- All public functions and methods have full type annotations.
- No `Any` without documented justification in an adjacent comment.
- No `type: ignore` without documented justification in an adjacent comment.
- Use `Protocol` over `ABC` where structural typing is sufficient.
- Shared types in `src/<project>/domain/types.py`.

## File Rules

- One class per file for domain and service modules. Utilities may group related functions.
- Test files mirror source structure: `src/<project>/services/foo.py` → `tests/services/test_foo.py`.
- No files larger than 300 lines. Split if approaching this limit.
- File naming: `snake_case.py`. Class naming: `PascalCase`. Constants: `UPPER_SNAKE`.

## Commit Rules

- Conventional commits: `feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:`.
- One logical change per commit.