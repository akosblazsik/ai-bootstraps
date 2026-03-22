---
name: design-system
description: Use this skill for shadcn/ui composition, app shell work,
  reusable component changes, and theme-sensitive UI decisions.
---

# Design System

## Use this skill when

- changing the app shell
- modifying reusable UI composition
- introducing a new reusable component pattern
- changing theme-sensitive behavior
- deciding whether to wrap or modify a base primitive

## Goal

Preserve compositional consistency while keeping customization bounded.

## Inputs to gather

- affected reusable components
- whether the change is one-off or systemic
- current app shell patterns
- theme or state implications
- whether shared primitives are involved

## Procedure

1. Determine whether the change belongs in composition or foundation.
2. Prefer wrappers and app-level composition.
3. Avoid modifying shared base primitives unless foundation work is the
   explicit goal.
4. Define active, passive, loading, error, empty, and disabled states
   when relevant.
5. Keep naming, spacing, and interaction patterns consistent.
6. State any app shell or navigation implications.

## Invariants

- composition before primitive modification
- state handling is part of UI design
- reusable surfaces remain coherent
- theme-sensitive behavior must remain legible and consistent

## Outputs

- UI design summary
- component placement guidance
- state checklist
- implementation guidance
- review focus
