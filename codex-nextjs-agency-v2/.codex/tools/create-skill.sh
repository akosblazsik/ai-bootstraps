#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: .codex/tools/create-skill.sh <slug> <description>"
  exit 1
fi

slug="$1"
shift
description="$*"

skills_dir=".codex/skills"
skill_dir="$skills_dir/$slug"
skill_file="$skill_dir/SKILL.md"

if [[ -e "$skill_dir" ]]; then
  echo "Skill already exists: $skill_dir"
  exit 1
fi

mkdir -p "$skill_dir"

cat > "$skill_file" <<EOF
---
name: $slug
description: $description
---

# $slug

## Use this skill when

- describe the recurring task class
- describe the bounded applicability
- describe when it adds functional value

## Goal

State the smallest stable operating purpose of the skill.

## Inputs to gather

- required inputs
- relevant repo or framework evidence
- constraints

## Procedure

1. Define the recurring pattern.
2. Define the smallest correct sequence.
3. Keep outputs inspectable.
4. State any required verification focus.

## Invariants

- list the rules that must not be violated
- keep them short and strict

## Outputs

- decision summary
- implementation guidance
- verification focus
EOF

echo "Created $skill_file"
