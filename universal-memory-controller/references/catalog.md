# Universal Memory Controller Reference

## Loading Strategies
- **full-load**: Load entire file into memory. Best for small files (<50MB default) and random access.
- **chunked**: Load file in configurable chunks. Constant memory regardless of file size. Best for medium-large files (50MB-1GB).
- **streaming**: Read small buffers sequentially. Minimal memory (one active buffer). Best for very large files (>1GB) and sequential processing.
- **mmap**: Memory-map file into virtual address space. OS loads pages lazily. Best for large files with random access.
- **temp-file**: Write intermediate data to disk. Best when results exceed RAM or multi-stage processing.
- **hybrid**: Combine strategies across operation phases.

## MemoryOptions Structure
- limits: maxMemoryMB, maxSingleObjectMB, maxConcurrentFiles, maxBatchSize, reservedForSystemMB, softLimitPercent, hardLimitPercent
- strategy: mode (auto|full-load|chunked|streaming|mmap|temp-file|hybrid), preferSpeed, chunkSizeMB, streamBufferSizeKB, mmapEnabled, tempFileEnabled, tempDir
- bufferPool: enabled, smallSize, mediumSize, largeSize, maxBuffers, reuseEnabled
- pressure: monitoring, checkInterval, gcOnWarning, reduceWorkersOnWarning, pauseOnCritical, abortOnEmergency
- cleanup: autoRelease, releaseAfterMs, tempFileCleanup, poolCleanupOnIdle
- statistics: enabled, trackPerOperation, exportInterval, exportPath

## Presets
- **maxima velocidad**: maxMemoryMB=8192, mode=full-load, large buffer pool. For servers with abundant RAM.
- **minimo consumo**: maxMemoryMB=256, mode=streaming, small buffer pool. For embedded/low-RAM systems.
- **balanceado** (default): maxMemoryMB=2048, mode=auto. Balance speed and consumption.
- **servidor**: maxMemoryMB=4096, maxConcurrentFiles=50, aggressive pressure reduction. For web services.
- **embedded**: maxMemoryMB=64, mode=streaming, mmap disabled, tiny buffer pool. For IoT/Raspberry Pi.

## Pressure Levels
- **Normal (0-60%)**: Normal operation, all workers active, buffer pool can grow.
- **Warning (60-80%)**: Early alert, reduce allocations, force GC, reduce parallel workers.
- **Critical (80-95%)**: Pause non-critical operations, release buffers aggressively, switch to streaming, notify user.
- **Emergency (>95%)**: Abort non-essential operations, emergency cleanup, save state, notify critical error.

## Worker Adjustment by Pressure
- Normal: 8 workers
- Warning: 4 workers
- Critical: 2 workers
- Emergency: 1 worker (finalization only)

## Buffer Pool Sizes
- Small: 4KB (headers, metadata, short lines)
- Medium: 64KB (typical processing blocks)
- Large: 1MB (large file chunks)

## Zero-Copy Techniques
- Buffer views: subsets without copying
- SharedArrayBuffer: shared memory between workers
- Transferable objects: transfer ownership without copying
- Memory-mapped views: access mmap without copying

## Error Handling
- **OOM**: Early detection via monitoring, prevention via limits, recovery via cleanup.
- **Corrupt file**: Detect via magic bytes/checksums, graceful handling (skip/report).
- **Read error (EIO, permissions)**: Retry with backoff, release partial resources, continue batch.
- **Cancelled operation**: Immediate cleanup, release buffers to pool, delete temp files, consistent state.
- **Timeout**: Abort operation, clean resources, report timeout, option to retry.
- **Recovery levels**: Retry with conservative strategy → Fallback to safer strategy → Abort with state saved.

## Libraries by Language
- **Node.js**: stream, buffer, heap-stats, memwatch-next, worker_threads
- **Python**: mmap, memory_profiler, itertools, multiprocessing, memoryview
- **Rust**: memmap2, bytes, tokio, rayon
- **Go**: eddycjy/mmap, io, runtime, sync/pool

## Integration
- ParallelOrchestrator: adjusts workers based on memory pressure, shared backpressure
- Progress Orchestrator: shows memory usage in progress, visual alerts on pressure
- SmartScanner: provides file sizes for strategy decision, groups files by size
- IncrementalCache: stores intermediate results, avoids reprocessing large files
- ValidationOrchestrator: validates memory sufficiency before operations
- Bootstrap: detects available system memory, adjusts initial configuration

## Statistics Collected
- Current/peak/average memory (RSS, heap)
- Pressure percentage
- Strategy usage count and optimal hit rate
- Buffer pool hit rate, active buffers, memory saved by reuse
- Operations completed/failed, average time per operation
- Total memory saved vs full-load, global efficiency
