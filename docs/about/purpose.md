
# Purpose

A **minimal task runner** with simplified syntax, streamlined operation, and an embedded Lua scripting engine.


## Why Rivet?

### Grow without outgrowing your Taskfile

Taskfiles are great when you start out. Simple commands are clean and easy to read. The problem shows up later, when you try to do something even moderately complicated: nested loops, real conditions, or dynamic variables. YAML and Go templates are clumsy at this. Logic gets messy fast, and at some point you hit a wall and move on to alternatives.

Rivet resolves that complexity by building [Lua](../usage/lua.md) directly into the runner. You keep your tasks and dependencies in a standard Taskfile, and when a workflow becomes more advanced or requires fine-grained control, embedded Lua gives you a clean, idiomatic way to handle it.

### Portable workflows

Rivet is for people who want cross-platform workflows without maintaining separate Bash and PowerShell scripts. Because Lua is built right into the binary, your control flow, file checks, and loops run identically everywhere.

The actual shell commands you run still depend on the OS, of course, but the orchestration around them stays completely portable.

### Human and AI workflows

Keeping workflows as named tasks (`rivet --list` and `rivet --list-all`) gives both humans and AI agents a clear structure to work with. When logic is needed, a Lua script inside a Taskfile is easier to write, review, and maintain than dense templates or fragile shell one-liners.

AI can write a complex Makefile or shell script in seconds, which is great until you actually have to read, debug, or maintain it six months later. Lua is a much better target for LLM code generation: concise, reliable, and easy to read.

Keeping workflows as named tasks (`rivet --list` and `rivet --list-all`) gives both humans and AI agents a clear structure to work with. When logic is needed, a Lua script inside a Taskfile is easier to write, review, and maintain than dense templates or fragile shell one-liners.


## Benchmarks

### Operational Metrics

!!! abstract "Methodology"
    The purpose of these operational metrics is to assess Rivet's suitability for deploying, operating, and developing Taskfiles.
    The comparison is made against Makefiles, shell scripts, and cURL — the foundations of modern software systems (despite being 50, 37 and 30 years old respectively at the time of writing in 2026).

    **Philosophy:** "Less is more"


| Metric | Rivet | Task | Factor |
| :--- | :---: | :---: | :---: |
| **Executable Size** | **11 MB** | 51 MB | **4.64x smaller** |
| **CLI Parameters** | **44** | 46 | **too many** |
| **-> as Envars** | 48% | **49%** | **too few** |
| **Schema** | **51** | 62 | **1.22x less** |
| **Config** | **0** | 19 | **no contest** |


### Workload Metrics


!!! info "Benchmark System"
    Intel(R) Core(TM) Ultra 9 285H (16-core laptop processor, 32 GB RAM) / Linux<br>Rivet v0.3.0; Task v3.53.1


| Workload | Rivet ms/op | Task ms/op | Speedup Factor (Rivet) | Rivet MB/op (allocs) | Task MB/op (allocs) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Hello World** | **0.153** | 0.243 | **1.59x faster** | **0.119** <br> (826) | 0.292 <br> (991) |
| **500 tasks, run single task** | **9.80** | 13.60 | **1.39x faster** | **8.77** <br> (118,929) | 12.69 <br> (137,203) |
| **500 tasks, run all tasks** | **99.52** | 601.34 | **6.04x faster** | **123.23** <br> (729,849) | 903.63 <br> (1,667,291) |
| **Mtime, 100 files / depth 2** | **1.23** | 1.50 | **1.22x faster** | **0.253** <br> (2,160) | 0.653 <br> (2,607) |
| **Mtime, 500 files / depth 3** | **2.03** | 2.86 | **1.41x faster** | **0.616** <br> (4,605) | 1.138 <br> (5,100) |
| **Mtime, 10k files / depth 3** | **20.41** | 30.17 | **1.48x faster** | **6.479** <br> (52,225) | 11.10 <br> (56,002) |
| **Mtime, 10k files / depth 6** | **52.06** | 72.83 | **1.40x faster** | **12.63** <br> (92,595) | 17.81 <br> (89,701) |


!!! info "Single-Core Benchmark System"
    Intel(R) Core(TM) Ultra 9 285H (16-core laptop processor, 32 GB RAM) / Linux<br>Pinned to one CPU core with `taskset` and `GOMAXPROCS=1`<br>Rivet v0.3.0; Task v3.53.1


| Workload | Rivet ms/op | Task ms/op | Speedup Factor | Rivet MB/op (allocs) | Task MB/op (allocs) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Hello World** | **0.182** | 0.471 | **2.58x faster** | **0.106** <br> (848) | 0.354 <br> (1,057) |
| **500 tasks, run single task** | **12.244** | 14.687 | **1.20x faster** | **8.734** <br> (118,965) | 12.800 <br> (137,300) |
| **500 tasks, run all tasks** | **147.890** | 734.922 | **4.97x faster** | **125.498** <br> (755,350) | 978.859 <br> (1,719,994) |
| **Mtime, 100 files / depth 2** | **0.878** | 1.958 | **2.23x faster** | **0.221** <br> (2,129) | 0.693 <br> (2,601) |
| **Mtime, 500 files / depth 3** | 3.040 | **2.609** | **1.17x slower** | **0.508** <br> (4,570) | 1.118 <br> (5,109) |
| **Mtime, 10k files / depth 3** | **27.872** | 31.564 | **1.13x faster** | **6.198** <br> (52,163) | 10.631 <br> (55,946) |
| **Mtime, 50k files / depth 3** | **106.945** | 174.133 | **1.63x faster** | **31.080** <br> (252,174) | 52.458 <br> (269,492) |
| **Mtime, 10k files / depth 6** | 74.888 | **74.680** | **≈1.00x (tie)** | **12.334** <br> (92,514) | 16.516 <br> (89,563) |



### Commentary

Both Rivet and Task run quickly on the latest generation of high-performance laptops, with Rivet faster overall. Rivet's performance advantage is more pronounced on constrained systems. Its results benefit from optimizations to YAML parsing, variable handling, task execution, and other areas; these improvements affect both CPU and memory performance.

The remaining architectural limitations that contribute to unnecessary CPU and memory use are:

* **YAML parsing and Taskfile schema complexity:** This structural limitation might be addressed by simplifying the schema and migrating to a streaming YAML parser. The current parser itself does not appear to be the cause; experiments with `goccy/yaml` did not improve parsing performance.
* **Compiler and variable handling:** Developing a single-pass, evaluate-on-demand compiler and template engine could reduce runtime and allocations by over 50%. This is the largest identified architectural inefficiency.
* **Shell integration with `mvdan.cc`:** Shell operations are the second most expensive part of execution, after compilation. A different integration approach could improve performance, especially for tasks with multiple commands.