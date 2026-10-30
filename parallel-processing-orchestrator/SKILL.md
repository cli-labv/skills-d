---
name: parallel-processing-orchestrator
description: Universal parallel processing orchestrator for CLI applications executes multiple jobs simultaneously through parallel_map interface configures workers batch size retry cancellation error handling preserves order limits memory prevents race conditions integrates with progress orchestrator smart scanner and incremental cache
---

# Universal Parallel Processing Orchestrator

Execute multiple jobs simultaneously through a configurable parallel processing layer with thread, async, or queue-based workers.

## When to use it
- The user needs to process multiple items concurrently to reduce total processing time.
- A reusable layer is required for image converters, file downloaders, data processors, compilers, or any app processing collections.
- The interface `parallel_map(items, worker, options)` is needed with workers, batch size, retry, cancellation, and error handling.
- Order preservation, memory limits, backpressure, and race condition prevention are required.
- Integration with Progress Orchestrator, SmartScanner, and IncrementalCache is needed.

## Main workflow
1. Receive items, a worker function, and options (maxWorkers, workerType, batchSize, preserveOrder, retry, errorHandling, cancellation, memory, progress, metrics).
2. Detect operation type: IO-bound (async/threads, many workers), CPU-bound (processes, workers = CPU cores), or mixed (hybrid).
3. Calculate optimal worker count: IO-bound uses min(items, config limit, system limit); CPU-bound uses min(items, CPU cores, config limit).
4. Detect when NOT to parallelize: very small sets (<10 items), dependent operations, limited resources, atomic operations, or worker already parallel internally.
5. Create a WorkerPool that reuses workers, implements backpressure, and adjusts size dynamically.
6. Queue tasks with FIFO/LIFO/priority, support selective cancellation, pause, and resume.
7. Preserve original order with OrderPreserver (index-based reordering) or disable for max performance.
8. Handle errors with RetryManager (none, fixed, exponential, exponential+jitter, custom) and Circuit Breaker for cascade failure protection.
9. Collect errors without stopping all processing (continue, failFast, threshold, retryAll strategies).
10. Report progress per worker and globally via Progress Orchestrator integration.
11. Collect metrics: total time, per-task time, throughput, speedup vs sequential, efficiency, error rates.
12. Support graceful cancellation on Ctrl+C with complete_current, abort_immediately, or checkpoint_and_exit strategies.
13. Clean up resources (temp files, connections, workers, locks) on completion or cancellation.

## Rules and best practices
- Auto-detect IO-bound vs CPU-bound and select optimal strategy.
- Do not parallelize very small sets (<10 items) where overhead exceeds benefit.
- Preserve order only when important; disable with preserveOrder: false for max speed.
- Implement backpressure to avoid memory saturation.
- Differentiate recoverable vs fatal errors; continue processing on recoverable errors when configured.
- Use circuit breaker to avoid cascading failures.
- Support sequential mode for testing and debugging.
- Clean up all resources on cancellation or completion.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/parallel.sh as the processing entry point.
- Use references/ for implementation examples per language (Node.js, Python, Rust, Go, Bash).
- Use assets/ for parallel.config.json configuration samples.

## Usage examples
- User says: "convert multiple images in parallel" → Apply this skill.
- User says: "download many files concurrently with retry" → Apply this skill with IO-bound preset.
- User says: "process data files with CPU-bound parallelism" → Apply this skill with CPU-bound preset.
- User says: "integrate parallel processing with scanner and cache" → Apply this skill together with universal-file-scanner and incremental-cache-system.
