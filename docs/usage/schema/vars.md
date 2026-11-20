# Variable

Variables may be scalar values or mappings. Mapping values can use:

- `sh`: A shell command whose output supplies the value.
- `ref`: A reference to another variable.
- `map`: A map-valued variable.

Shell variables can be declared in Taskfile, task, and task-call `vars`.
Their commands may reference other variables:

```yaml
version: 42
vars:
  NAME: {sh: "printf world"}
tasks:
  greet:
    vars:
      MESSAGE: {sh: "printf 'Hello, %s' '{{.NAME}}'"}
    cmds:
      - echo "{{.MESSAGE}}"
```

Rivet removes one trailing newline from the command output. During a run,
identical commands after template expansion share a cached result; a failing
command fails variable resolution.
