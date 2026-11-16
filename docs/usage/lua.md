# Lua

Lua scripts can be used as commands in version 42 Taskfiles.

```yaml
version: 42

tasks:
  greet:
    vars:
      NAME: world
    cmds:
      - lua: |
          print("Hello, " .. ctx.vars.NAME)
          rivet.task("print-name", {NAME = ctx.vars.NAME})
  print-name:
    cmds:
      - cmd: echo "{{.NAME}}"
```

## Variables

Lua scripts receive these variable tables in the Lua context (`ctx`):

- `ctx.vars`: Values visible to the current task. Unqualified names resolve
  call vars, task vars, current namespace vars, Rivet special vars, then
  environment values. Use `ctx.vars[":NAME"]` for root-scoped values or
  `ctx.vars["build:TOOL"]` for a namespaced values.
- `ctx.root`: Root environment (environment and root Taskfile dotenv),
  root Taskfile vars, and CLI vars.
- `ctx.global`: For root tasks, the same values as `ctx.root`. For namespaced
  tasks, root environment (environment and root Taskfile dotenv) plus
  the current namespace's Taskfile vars.
- `ctx.ns`: Variables by namespace, such as `ctx.ns.build.TOOL` or
  `ctx.ns["build:cross:TOOL"]`.
- `ctx.task`: Task dotenv, task vars, and call vars.

In a namespace, root Taskfile vars are not available through unqualified names;
use `ctx.vars[":NAME"]` or `ctx.root.NAME`. Namespace vars can shadow
environment values.

## Tasks and commands

Scripts can also use:

- `rivet.task(name, vars)`: Run a task with a table of call vars.
- `rivet.cmd(command)`: Run a shell command in the task's environment.
- `rivet.log.trace`, `debug`, `info`, `warn`, `error`: Write log messages.
- `rivet.fn`: Utility functions including `split`, `joinPath`, `shellQuote`,
  `patsubst`, `fromYaml`, and `toYaml`. See the
  [Lua function reference](templater/lua.md) for all wrappers and their
  template counterparts.

Task names resolve relative to the calling Taskfile. In a namespace, a bare
name prefers a task defined in that same Taskfile. Use a leading `:` to call a
root task, or a qualified name such as `build:compile` to name a task in a
namespace.

Task and shell command failures raise Lua errors, which can be caught with
`pcall`. An uncaught Lua error fails the command unless `ignore_error` is set.

## Conditions and loops

Use Lua conditions and loops to control commands and task calls.

```yaml
version: 42

vars:
  services: [frontend, backend]

tasks:
  check:
    cmds:
      - lua: |
          if ctx.vars.ENABLED == "yes" then
            for _, service in ipairs(ctx.vars.services) do
              rivet.task("start", {SERVICE = service})
            end
          end
  start:
    cmds:
      - cmd: echo "Starting {{.SERVICE}}"
```

## Transform

Task `sources`/`generates` fields or a [transform](schema/transform.md) can
populate these values:

- `ctx.transform`: `MATCH`/`YIELD` pairs produced by transform `subst`.
- `ctx.sources`: Resolved input paths from task `sources` or transform `matches`.
- `ctx.generates`: Resolved output paths from task `generates` or transform
  `yields`.

For example, to copy each matched file to its generated path:

```yaml
version: 42

tasks:
  copy:
    transform:
      subst: '%.old:%.new'
    cmds:
      - lua: |
          for _, pair in ipairs(ctx.transform) do
            rivet.cmd("cp " .. rivet.fn.shellQuote(pair.MATCH) ..
                      " " .. rivet.fn.shellQuote(pair.YIELD))
          end
```
