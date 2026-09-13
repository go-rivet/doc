# Contributing

Review this guide to understand the core design philosophy, alignment goals, and contribution guidelines before initiating work on the codebase.

## Project Scope

**Rivet is a hard fork of [Task](https://github.com/go-task/task)**. Rivet diverges from the upstream project to serve a **specific purpose**: to act as a minimal, lightweight task runner engine built strictly for speed and simplicity. 

To maintain this focus, the project adheres to the following principles:

* **Hyper-Minimalism:** Feature bloat is avoided. Code that unnecessarily expands the core engine footprint will not be merged.
* **Strict Alignment:** Only contributions explicitly aligned with the core goals of Rivet are accepted.

### Rivet vs. Upstream

> Info: Rivet is a hard fork of the upstream project, the codebase has been significantly altered.

Because Rivet has a highly restricted, niche scope, standard or broad feature requests are generally not a fit for this repository. 

* **General-purpose utility or broad features:** Contribution to the upstream **[Task project](https://github.com/go-task/task)** is advised, given its larger, more established community.
* **Optimization of the minimal footprint:** Proposals that directly enhance the speed or simplicity of the core engine belong in this repository.


## Introducing New Concepts

Creative extensions are welcome, but the core runner engine must remain isolated.

* **Separate Ecosystem Repositories:** Major new concepts—such as a **Terminal User Interface (TUI)**—must be developed as standalone projects in a dedicated repository rather than integrated into the main engine codebase.
* **Awareness of Effort:** Building a new sub-project requires a long-term commitment to maintenance, issue triage, and updates. Proponents of new ecosystem tools must be prepared to sustain that effort.


## Technical Expectations & AI Policy

Rivet is engineered in Go with a focus on high performance and structural integrity. Because the engine requires precise logic, strict standards apply to code contributors:

* **Sufficient Experience & Skill:** Technical proficiency in Go, concurrent programming, and CLI architecture is required. Code must be clean, idiomatic, and fully tested. E2E tests are preferred over Go unit tests.
* **Core Codebase AI Usage:** The core codebase leverages AI-assisted development tools to accelerate engineering. However, unverified AI output or entirely automated code generation is not accepted. E2E tests are preferred as the validation method.
* **No AI-Authored Pull Requests:** Do not bother opening pull requests with AI-generated code. Instead, simply open an issue, preferably with an E2E test that can become part of the regression test suite.
* **No AI-Authored Unit Tests:** Pull requests containing AI-generated test cases will be closed.
