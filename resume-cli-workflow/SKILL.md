---
name: resume-cli-workflow
description: Resume workflow for CLI extraction apps with output validation.
---

# Resume CLI Workflow

## When to use it

- Finalizing a CLI app that resumes extraction from saved state.

## Main workflow

1. Compute the expected output directory for each recorded file.
2. Skip only if the expected output exists and no pending compatibility fix exists.
3. Otherwise re-extract.

## Rules and best practices

- Never skip based only on state without checking output existence.

## Usage examples

- User says: "finalize the CLI resume logic" → Apply this skill.
- User says: "fix stale resume state handling" → Apply this skill.
