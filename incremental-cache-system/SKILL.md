---
name: incremental-cache-system
description: Universal incremental cache system avoids reprocessing unchanged files stores structured metadata path size mtime hash status result config version classifies elements as New Modified Unchanged Deleted RequiresReprocessing multiple validation levels from fast size mtime to full hash supports manual invalidation TTL config change detection corruption recovery integrates with SmartScanner and Progress Orchestrator
---

# Universal Incremental Cache System

Avoid reprocessing unchanged files by storing structured metadata and classifying elements automatically.

## When to use it
- The user needs to avoid reprocessing files that have not changed since the last run.
- A reusable caching layer is required for image converters, report generators, compilers, document analyzers, synchronizers, or any app processing file collections.
- Elements must be classified as New, Modified, Unchanged, Deleted, or RequiresReprocessing.
- Multiple validation levels are needed: fast (size + mtime), balanced (size + mtime + partial hash), full (full SHA-256 hash), or smart auto-selection.
- Integration with SmartScanner and Progress Orchestrator is required.

## Main workflow
1. Receive a list of files and options (validation level, config hash, storage format, TTL).
2. Load the existing cache from disk (JSON, SQLite, or binary format).
3. For each file in the system, classify it: New (not in cache), Modified (changed), Unchanged (identical), Deleted (in cache but not in system), or RequiresReprocessing (config or TTL changed).
4. For each cached file not present in the system, classify as Deleted and clean its result.
5. Process only New, Modified, and RequiresReprocessing elements; skip Unchanged ones.
6. Update the cache with results: path, size, mtime, hash, status, output path, output hash, config used, timestamps, access count.
7. Persist the cache atomically: write to temp file first, then rename; keep automatic backups.
8. Detect and recover from cache corruption using checksums, schema validation, and backup restoration.
9. Report statistics: hit rate, time saved, elements skipped vs processed, cache size.
10. Integrate with Progress Orchestrator to show classification and processing progress.

## Rules and best practices
- Classify each element once at start and keep the classification during the operation.
- Never reprocess Unchanged elements; reuse stored results.
- Detect configuration changes via config hash and mark affected elements as RequiresReprocessing.
- Use atomic writes to prevent cache corruption; keep up to 3-5 automatic backups.
- Support validation levels: fast for large systems, balanced for production, full for critical apps, smart for auto-selection.
- Respect TTL per element or globally; expire stale entries automatically.
- Handle path traversal, permissions, and special files gracefully.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/cache.sh as the cache entry point.
- Use references/ for implementation examples per language (Node.js, Python, Rust, Go, Bash).
- Use assets/ for .cache.config.json configuration samples.

## Usage examples
- User says: "add a cache so my converter does not reprocess unchanged images" → Apply this skill.
- User says: "I need incremental build caching for my compiler" → Apply this skill with full validation.
- User says: "detect config changes and reprocess only what is needed" → Apply this skill.
- User says: "integrate cache with scanner and progress bar" → Apply this skill together with universal-file-scanner and progress-orchestrator.
