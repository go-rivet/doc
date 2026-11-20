# Task

Task definitions support the following fields:

- `cmd` / `cmds`: Commands to run.
- `lua`: Lua script to run before dependencies.
- `deps`: Tasks to run first.
- `label`, `desc`, `summary`: Display information.
- `prompt`, `requires`: Interactive execution requirements.
- `aliases`: Alternate task names.
- `transform`: Input and output file relationships.
- `dir`, `set`, `shopt`, `vars`, `dotenv`: Task execution context.
- `interactive`, `internal`, `ignore_error`, `failfast`: Execution behavior.
- `prefix`, `run`, `platforms`, `watch`: Output, execution, and watch configuration.

Tasks also have shorthand forms: a scalar task value is one command, and a
sequence is a list of commands.

Task dotenv filenames can reference task and call variables:

```yaml
version: 42
tasks:
  greet:
    vars:
      ENV_FILE: .env
    dotenv: ["{{.ENV_FILE}}"]
    cmds:
      - echo "{{.GREETING}}"
```

Filename variables must resolve before the task dotenv files are loaded, so
they cannot depend on values available only in those files.
