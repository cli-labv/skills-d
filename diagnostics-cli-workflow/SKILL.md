---
name: diagnostics-cli-workflow
description: Diagnostics workflow for CLI apps scanning compressed files and filtering sidecars.
---

# Diagnostics CLI Workflow

## When to use it

- Finalizing a CLI app that scans compressed files and reports compatibility.

## Main workflow

1. Count real archives only.
2. Filter sidecars such as `*.zip:Zone.Identifier`.
3. Keep the `Especiales` row in the diagnostic summary.

## Rules and best practices

- Do not print extra diagnostic boxes.
- Keep summary rows compact.

## Usage examples

- User says: "finalize the CLI diagnostics" → Apply this skill.
- User says: "clean up diagnostic output" → Apply this skill.
