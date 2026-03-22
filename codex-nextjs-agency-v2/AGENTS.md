# Multi-Agent Working Agreement

This repository uses a functional multi-agent workflow.

The guiding rule is simple: add no role, no step, and no code unless it
adds functional value. Functional value means one or more of the
following:

- reduces ambiguity
- reduces architectural drift
- improves correctness
- improves evidence quality
- improves recovery from error
- improves repeatability
- improves throughput for recurring work

If a task can be completed correctly with fewer functions, use fewer
functions.

## Functional order

For non-trivial work, think in this order:

1. classify the task by required function
2. gather evidence when evidence is cheaper than guessing
3. design structure when structure is affected
4. design integrations when side effects are affected
5. implement the smallest coherent change
6. verify the intended behavior
7. review for coherence and drift
8. update docs when the knowledge surface changed

## Default agent roster

- orchestrator
- researcher
- architect
- integrator
- implementer
- verifier
- reviewer

## Core laws

- Server Components by default.
- Client Components only when interaction or browser-only APIs require it.
- Prefer composition and wrappers over modifying shared base primitives.
- Non-trivial UI work must account for loading, error, empty, disabled,
  and success states where relevant.
- Mutation and integration work must state validation, authorization,
  side effects, failure paths, and revalidation or invalidation behavior.
- Review protects coherence. It should not expand scope without cause.
- Verification is required for non-trivial mutations, integrations, and
  behaviorally meaningful UI changes.
- Documentation updates are part of the product-system, not an afterthought.

## Direct implementation rule

The implementer may work directly only when all of the following are true:

- no route, layout, boundary, or reusable system structure changes
- no mutation or external integration changes
- no framework-sensitive behavior needs evidence lookup
- no special verification plan is needed beyond obvious local checks

Otherwise, the orchestrator should classify the task and route it.

## Evidence rule

Do not guess when evidence is cheap.

Use docs, local patterns, CLI inspection, and available tools before
making framework-sensitive or repo-sensitive decisions.
