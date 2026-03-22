---
name: verification
description: Use this skill for defining the smallest credible proof
  that a behavior change works.
---

# Verification

## Use this skill when

- behavior changes in a meaningful way
- a mutation or integration changed
- reusable UI behavior changed
- a refactor claims behavior preservation
- the repository needs a precise verification path

## Goal

Produce the smallest credible proof, not the largest test plan.

## Inputs to gather

- intended behavior
- risk surface
- affected files or routes
- available scripts and tools
- whether the change is UI, mutation, integration, or structure related

## Procedure

1. Identify the highest-risk behavior that changed.
2. Choose the smallest credible checks.
3. Prefer cheap, high-signal checks first.
4. Separate what was verified from what remains unverified.
5. State residual risk honestly.

## Invariants

- verification scope must match risk
- checked behavior must be explicit
- unverified behavior must be acknowledged
- pass or fail must be clear

## Outputs

- verification scope
- checks to run
- critical path summary
- pass or fail summary
- residual risk
