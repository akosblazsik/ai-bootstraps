---
name: server-actions
description: Use this skill for forms, mutations, optimistic updates,
  and revalidation patterns built with Next.js Server Actions.
---

# Server Actions

## Use this skill when

- adding a form-backed mutation
- changing a server action
- adding optimistic UI around a mutation
- changing invalidation or revalidation behavior
- moving mutation logic into a safer lifecycle

## Goal

Make mutation lifecycle explicit, verifiable, and recoverable.

## Inputs to gather

- intent of the mutation
- input data shape
- validation requirements
- auth requirements
- side effects
- success and failure UX
- revalidation or invalidation needs

## Procedure

1. Define the input contract.
2. Define validation.
3. Define authorization, when relevant.
4. Define the effect.
5. Define failure behavior and user-visible recovery.
6. Define revalidation or invalidation explicitly.
7. Define pending, success, and error states in the UI.
8. Keep side effects visible and bounded.

## Invariants

- validation precedes execution
- authorization is explicit when required
- revalidation or invalidation is explicit
- error states are defined
- hidden side effects are not allowed

## Outputs

- mutation lifecycle summary
- action design notes
- UI state checklist
- implementation guidance
- verification focus
