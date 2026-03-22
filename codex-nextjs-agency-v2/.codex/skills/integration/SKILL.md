---
name: integration
description: Use this skill for route handlers, webhooks, external APIs,
  adapters, storage work, and other side-effect-heavy integrations.
---

# Integration

## Use this skill when

- calling external APIs
- building or changing webhooks
- adding adapters
- changing storage behavior
- handling retries, failures, or background effects

## Goal

Make side effects explicit, bounded, and resilient.

## Inputs to gather

- external dependencies
- request and response contracts
- auth and secret handling
- failure modes
- retry or idempotency needs
- observability requirements
- downstream invalidation or revalidation effects

## Procedure

1. Define the input and output contract.
2. Define validation and authorization.
3. Define the side effect.
4. Define expected failure modes.
5. Define retry, idempotency, or recovery behavior where relevant.
6. Define observability or operator impact where relevant.
7. Define cache, invalidation, or downstream effects explicitly.

## Invariants

- side effects are explicit
- failure handling is explicit
- retries are justified, not assumed
- contracts remain inspectable
- downstream effects are documented

## Outputs

- integration design summary
- contract and lifecycle notes
- recovery notes
- implementation guidance
- verification focus
