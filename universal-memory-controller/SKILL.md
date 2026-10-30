---
name: universal-memory-controller
description: Universal memory controller system manages memory for file processing applications decides load strategy full-load chunked streaming mmap or temp-file based on size and context uses buffer pool memory pressure monitoring automatic cleanup and statistics integrates with parallel orchestrator progress orchestrator smart scanner and incremental cache
---

# Universal Memory Controller

Manage memory for file processing applications to avoid OOM errors while processing files of any size.

## When to use it
- The user needs to process files of different sizes without consuming excessive memory.
- A reusable layer is required to decide automatically whether to load a file completely, use chunking, streaming, memory-mapping, or temp files.
- Configurable memory limits, batch size, concurrent files, and max object size are needed.
- Buffer pooling, memory pressure monitoring, automatic cleanup, and statistics are required.
- Integration with ParallelOrchestrator, Progress Orchestrator, SmartScanner, and IncrementalCache is needed.

## Main workflow
1. Receive a path or data and options (strategy, limits, buffer pool, pressure monitoring, cleanup).
2. Automatically select the optimal loading strategy: full-load for small files, chunked for medium files, streaming for very large files, mmap for random access, temp-file for intermediate results, or hybrid for complex multi-phase operations.
3. Return a MemoryHandle that abstracts access to data (buffer, stream, mmap, etc.).
4. Use BufferPool to pre-assign and reuse buffers (small, medium, large), reducing GC pressure and allocation overhead.
5. Monitor memory usage in real time (RSS, heap), calculate pressure percentage (0-100%), and detect growth trends.
6. React to pressure levels: normal (0-60%), warning (60-80%), critical (80-95%), emergency (>95%) by reducing workers, pausing, forcing GC, or aborting.
7. Integrate with ParallelOrchestrator to dynamically adjust worker count based on memory pressure.
8. Release resources explicitly after each task via release(); return buffers to the pool; clean temp files automatically.
9. Handle OOM, corrupt files, read errors, cancellations, and timeouts gracefully with retry or fallback to more conservative strategies.
10. Collect and export statistics: memory usage, strategy distribution, buffer pool hit rate, operations completed, total memory saved.

## Rules and best practices
- Auto-select strategy based on file size, available memory, operation type, and urgency.
- Never load a file completely into memory if it exceeds maxSingleObjectMB limit.
- Use streaming for files larger than the streaming threshold or for sequential processing.
- Use mmap for large files with random access patterns.
- Use temp-files when intermediate results exceed available RAM.
- Reduce parallel workers when memory pressure reaches warning or critical levels.
- Always release MemoryHandle after use; use auto-release timers as safety net.
- Keep buffer pool hit rate high; tune pool sizes based on workload.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/memory.sh as the memory controller entry point.
- Use references/ for implementation examples per language (Node.js, Python, Rust, Go).
- Use assets/ for memory.config.json configuration samples and presets.

## Usage examples
- User says: "process a 10GB CSV without running out of memory" → Apply this skill with streaming strategy.
- User says: "convert large images efficiently" → Apply this skill with chunked or mmap strategy.
- User says: "integrate memory control with parallel processing" → Apply this skill together with parallel-processing-orchestrator.
- User says: "monitor memory pressure during batch processing" → Apply this skill with pressure monitoring enabled.
