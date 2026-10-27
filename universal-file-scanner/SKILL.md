---
name: universal-file-scanner
description: Universal intelligent file system scanner discovers and analyzes folders files extensions hidden files duplicates excluded items and statistics reusable discovery layer for converters analyzers indexers compressors migrators integrations with progress orchestrator to show scan progress
---

# Universal Intelligent File Scanner

Discover and analyze file systems returning complete structure with folders, valid files, extensions, hidden files, duplicates, excluded items and detailed statistics.

## When to use it
- The user needs to scan an input path and know what files exist before processing.
- A reusable discovery layer is required for converters, analyzers, indexers, compressors, migrators, or any app that needs to know which files can be processed.
- Duplicate detection, extension filtering, and statistics are needed.
- Integration with Progress Orchestrator to show progress during scanning.

## Main workflow
1. Receive a path and optional ScanOptions (recursion, filtering, duplicates, performance, progress, output).
2. Validate the path: exists, accessible, directory or file, permissions.
3. Walk the file system recursively or with limited depth, handling symlinks, cycles, permissions, and special file systems (/proc, /sys, /dev).
4. Apply filters: include/exclude extensions, patterns, size, dates, hidden files, temp files.
5. Detect duplicates using fast (size+name), balanced (size+partial hash), or full (size+full SHA-256 hash) strategy, or smart auto-selection.
6. Calculate statistics: totals, grouping by extension/folder/type, largest/smallest/oldest/newest files, extensions distribution.
7. Return a complete ScanResult with summary, folders, files, duplicates, excluded, errors, and statistics.
8. Optionally use cache to reuse previous scan results with TTL and automatic invalidation.
9. Integrate with Progress Orchestrator to show scan progress (discovering, filtering, detecting duplicates, calculating stats).
10. Support streaming mode for systems with millions of files and scanSync/scanAsync variants.

## Rules and best practices
- Validate path accessibility before scanning; continue on inaccessible items and log errors.
- Detect and avoid infinite symlink cycles.
- Skip special systems and sockets/FIFOs by default; include only if user requests.
- Use natural sort for file names (archivo2 before archivo10).
- Persist scan configuration in .scanner.json with defaults and presets.
- Provide presets: fast, complete, production, minimal.
- Handle long paths (>260 chars on Windows) safely.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/scan.sh as the scanning entry point.
- Use references/ for implementation examples per language (Node.js, Python, Rust, Go, Bash).
- Use assets/ for .scanner.json configuration samples and presets.

## Usage examples
- User says: "scan my input folder and list all images" → Apply this skill.
- User says: "find duplicate files in my directory" → Apply this skill with duplicates enabled.
- User says: "analyze disk usage of a folder" → Apply this skill with stats and grouping.
- User says: "integrate scanning with progress bar" → Apply this skill together with progress-orchestrator.
