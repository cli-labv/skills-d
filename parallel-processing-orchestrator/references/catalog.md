# Parallel Processing Orchestrator Reference

## Interface
- `parallel_map(items, worker, options)` → `Promise<ParallelResult>`
- `parallel_for_each(items, worker, options)` → side effects, no result accumulation
- `parallel_reduce(items, worker, reducer, initial, options)` → map-reduce pattern
- `parallel_pipeline(stages, options)` → multi-stage pipeline
- `parallel_batch(items, worker, batchSize, options)` → batch processing
- `parallel_stream(items, worker, options)` → stream/iterator of results

## ParallelOptions Structure
- concurrency: maxWorkers, workerType, batchSize, preserveOrder, queueSize
- retry: enabled, maxAttempts, strategy, initialDelay, maxDelay, jitter, retryableErrors
- errorHandling: strategy (continue|failFast|threshold|retryAll), maxErrors, onError
- cancellation: enabled, gracefulShutdown, timeout, onCancel
- memory: maxMemoryMB, backpressure, gcThreshold, streamResults
- progress: enabled, updateInterval, showIndividual, style
- metrics: enabled, compareSequential, exportFormat, exportPath
- debug: sequentialMode, deterministicOrder, logLevel

## Presets
- **IO-bound**: many workers, async/threads, small batch — downloads, disk reads, API calls
- **CPU-bound**: workers = CPU cores, processes, larger batch — image processing, calculations, compression
- **mixed**: auto-detection, dynamic worker adjustment — complex pipelines
- **safe**: few conservative workers, aggressive retries, fail-fast — critical production
- **fast**: many aggressive workers, no retries, continue on errors — non-critical batch
- **testing**: forced sequential mode, deterministic order — unit tests, debugging

## Worker Type Selection
- **IO-bound**: async/threads, many workers, min(items, config limit, system limit)
- **CPU-bound**: processes, workers = CPU cores, min(items, CPU cores, config limit)
- **hybrid**: balance between threads and processes based on memory and load

## When NOT to Parallelize
- Very small sets (<10 elements): overhead exceeds benefit
- Operations with dependencies: sequential or pipeline recommended
- Limited resources: fewer workers or sequential mode
- Atomic operations: database transactions, mutual exclusion required
- Worker already parallel internally: avoid nested parallelism

## Retry Strategies
- **none**: immediate error on first failure
- **fixed**: fixed interval between retries
- **exponential**: backoff doubles each attempt (100ms, 200ms, 400ms...)
- **exponential + jitter**: adds randomness to avoid thundering herd
- **custom**: user-defined function based on attempt and error

## Circuit Breaker States
- **CLOSED**: normal processing, counting recent failures
- **OPEN**: failures exceed threshold, temporarily stop processing
- **HALF-OPEN**: after timeout, allow some test attempts

## Error Handling Strategies
- **continue**: collect errors but continue processing
- **failFast**: cancel all on first error
- **threshold**: continue until N errors, then cancel
- **retryAll**: retry only failed items at the end

## Order Preservation
- Assign unique index to each element
- Workers process in any order
- Results stored with index, reordered at end
- Can be disabled with preserveOrder: false for max performance

## Libraries by Language
- **Node.js**: p-map, p-limit, worker_threads, cluster, async, piscina
- **Python**: concurrent.futures, asyncio, multiprocessing, joblib, ray, pebble
- **Rust**: rayon, tokio, crossbeam, flume, async-std
- **Go**: goroutines, sync.WaitGroup, sync.Mutex, channels, errgroup, workerpool
- **Bash**: GNU parallel, xargs -P, background jobs, xjobs

## Metrics Collected
- Total execution time, per-task time (min, max, avg, p50, p95, p99)
- Setup time, teardown time, queue wait time
- Throughput: tasks/second, MB/s
- Efficiency: speedup vs sequential, parallel efficiency, overhead %
- Errors: total, by type, successful vs failed retries

## Integration
- Progress Orchestrator: shows per-worker and global progress, ETA, speed
- SmartScanner: delivers files via stream, parallel processing while scanning
- IncrementalCache: processes only new/modified/requires-reprocessing items
- Bootstrap: parallel dependency downloads and module compilation
- Adaptive Menus: configure workers, show last execution metrics
- CLI Banner System: show parallel processing stats in banner
