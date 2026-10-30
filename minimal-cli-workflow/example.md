# Example

User request: "Make the CLI output minimal with only the progress bar and summary rows."

Expected change:
- Skip confirmation when `--yes` is set.
- Keep the progress bar.
- Keep only summary rows in the result.
- Remove separate special-case boxes.
