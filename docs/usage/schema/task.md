# Task

Task definitions support the following fields:

- `cmd` / `cmds`: Commands to run.
- `deps`: Tasks to run first.
- `label`, `desc`, `summary`: Display information.
- `prompt`, `requires`: Interactive execution requirements.
- `aliases`: Alternate task names.
- `transform`: Input and output file relationships.
- `status`, `preconditions`: Conditions used by freshness checks.
- `dir`, `set`, `shopt`, `vars`, `dotenv`: Task execution context.
- `interactive`, `internal`, `ignore_error`, `failfast`: Execution behavior.
- `prefix`, `run`, `platforms`, `if`, `watch`: Output, execution, and watch configuration.

Tasks also have shorthand forms: a scalar task value is one command, and a
sequence is a list of commands.
