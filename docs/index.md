
# Rivet

Rivet is a minimal task runner written in Go, built for speed, simplicity, and real logic through an embedded Lua scripting engine.

## :lucide-code: Quickstart

Keep simple commands simple, and use Lua when you need real logic:

```yaml title="Taskfile.yml"
version: 42

vars:
  NAMES: [Ada, Linus, Grace]

tasks:
  greet:
    cmds:
      - lua: |
          for _, name in ipairs(ctx.vars.NAMES) do
            if name ~= "Linus" then
              rivet.task("hello", {NAME = name})
            end
          end
  hello:
    cmds:
      - echo "Hello, {{.NAME}}!"
```

Run `rivet greet`:

```text
Hello, Ada!
Hello, Grace!
```

---

## :lucide-terminal: Installation

Get the single static binary for your environment:

```bash
go install github.com/go-rivet/rivet/cmd/rivet@latest
```

---

## :lucide-layers: Project Repositories

Explore the codebases making up the Rivet ecosystem:

*   **[:lucide-binary: Rivet](https://github.com/go-rivet/rivet)** — The Rivet core execution binary.
*   **[:lucide-book-open: Documentation](https://github.com/go-rivet/doc)** — Source for technical documentation and guides.
*   **[:lucide-box: Docker Builds](https://github.com/go-rivet/docker)** — Pre-built production images.
*   **[:lucide-shield-check: E2E Test Suite](https://github.com/go-rivet/e2e)** — System validation and integration tests.
