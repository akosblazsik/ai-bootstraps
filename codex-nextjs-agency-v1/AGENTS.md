# Codex Working Agreement

This repository uses a specialist multiagent workflow.

## Main orchestration rule

For non-trivial work, start with `openai-codex-orchestrator`.

Treat a task as non-trivial if it involves any of:
- multiple files
- architecture or UX decisions
- route/layout/server-client boundary decisions
- cache, auth, mutation, or data-flow design
- API integration, webhooks, or adapters
- refactoring, review, or migration
- reusable UI-system implications

Do not send substantial work directly to implementation unless the task is
clearly bounded and structurally trivial.

## Default workflow

1. `openai-codex-orchestrator` receives the task
2. it decides the smallest credible specialist split
3. architecture and/or integration design is clarified first
4. implementation follows only after structure is clear enough
5. review is required before final approval for non-trivial work

## Specialist routing

- `nextjs-platform-architect`
  for route trees, layouts, server/client boundaries, data flow,
  cache strategy, auth boundaries, and file/module structure

- `nextjs-integration-engineer`
  for server actions, route handlers, adapters, external APIs,
  auth-aware mutations, webhooks, and long-running workflows

- `nextjs-feature-implementer`
  for bounded approved coding tasks

- `nextjs-shadcn-reviewer`
  for correctness, architecture fit, accessibility, maintainability,
  and smallest repair path

## Direct implementation is allowed only if all are true

- no route or layout implications
- no meaningful mutation or state complexity
- no reusable UI-system implications
- no auth or integration implications
- low risk of architectural drift