# Lua

Lua scripts can be used as commands in version 42 Taskfiles:

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

Lua scripts can access:

- `ctx.vars`: Variables available to templates, including qualified names such
  as `ctx.vars["build:TOOL"]`.
- `ctx.global`: The current Taskfile's global variables.
- `ctx.root`: Root environment, Taskfile dotenv, Taskfile vars, and CLI vars,
  available from any namespace.
- `ctx.ns`: Variables by namespace, such as `ctx.ns.build.TOOL` or
  `ctx.ns["build:cross"].TOOL`.
- `ctx.task`: Task dotenv, task vars, and call vars. Call vars override task vars.
- `vars`: A copy of `ctx.vars` that can be changed and passed to another task.

For a root task, `ctx.global` and `ctx.root` contain the same values. For a
namespaced task, `ctx.global` contains the environment and that namespace's
vars, without root Taskfile vars or CLI vars. Namespace vars can shadow
environment values.

In a namespace, use a leading `:` for root Taskfile vars, for example
`ctx.vars[":NAME"]`, or use `ctx.root.NAME`. Unqualified names use task and
current namespace values; environment values remain available and can be
shadowed. Each table is a separate snapshot: changes to `ctx` or `vars` do not
change other tables, task variables, or later Lua commands.

## Tasks and commands

Scripts can also use:

- `rivet.task(name, vars)`: Run a task with a table of call vars.
- `rivet.cmd(command)`: Run a shell command in the task's environment.
- `rivet.log.trace`, `debug`, `info`, `warn`, `error`: Write log messages.
- `rivet.fn`: Utility functions including `split`, `joinPath`, `shellQuote`,
  `patsubst`, `fromYaml`, and `toYaml`.

Task and shell command failures raise Lua errors, which can be caught with
`pcall`. An uncaught Lua error fails the command; Lua return values are ignored.

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

Tasks with a [transform](schema/transform.md) make these values available:

- `ctx.sources`: Paths matching `matches`.
- `ctx.generates`: Output paths from `yields`.
- `ctx.transform`: `MATCH` and `YIELD` pairs from `subst`.

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
