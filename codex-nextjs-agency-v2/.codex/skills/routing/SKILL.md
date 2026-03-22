---
name: routing
description: Use this skill for route, layout, navigation, and boundary
  work in a Next.js App Router repository.
---

# Routing

## Use this skill when

- adding or changing routes
- restructuring layouts
- changing navigation surfaces
- splitting server and client boundaries
- changing route-local loading or error handling

## Goal

Preserve a sound route tree and keep structural change minimal,
predictable, and explicit.

## Inputs to gather

- affected route segments
- current layout hierarchy
- existing loading and error surfaces
- auth or data dependencies
- whether the work changes server or client boundaries

## Procedure

1. Identify the smallest affected route surface.
2. Determine whether the change is local or reusable.
3. Keep Server Components as the default.
4. Use Client Components only for interaction or browser-only behavior.
5. State how loading, error, and empty states are affected.
6. Define any layout, boundary, or navigation implications.
7. Recommend the smallest coherent file changes.

## Invariants

- do not redesign unrelated route structure
- do not introduce client boundaries without need
- keep navigation and layout implications explicit
- keep loading and error behavior consistent with the route surface

## Outputs

- route and layout decision summary
- affected segments and files
- boundary notes
- implementation guidance
- verification focus
