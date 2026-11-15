# Transform

`transform` describes the files a task reads and writes. Rivet uses these
paths for freshness checks and makes them available to commands.

```yaml
tasks:
    compile:
        transform:
            subst: 'src/%.old:build/%.new'
            matches:
                - src/**/*.old
            yields:
                - build/{{.TASK}}.stamp
```

## `subst`

`subst` pairs an input pattern with an output pattern using the form
`from:to`. The first `%` in each pattern is replaced by the same matched stem:

```yaml
transform:
    subst: '%.old:%.new'
```

For `file_1.old`, this produces `file_1.new`. Directory prefixes can also be
changed, for example `src/%.old:build/%.new`.

Each substitution pairs an input path with its generated output path.

## `matches`

`matches` lists input paths or glob patterns:

```yaml
transform:
    matches:
        - file_*.txt
        - '**/*.txt'
```

Patterns support exact paths, `*`, `?`, and recursive `**` globs. Paths are
resolved relative to the task directory. A match is also an input to the
task's up-to-date check.

## `yields`

`yields` lists output paths or glob patterns and is used for task outputs:

```yaml
transform:
    yields:
        - build/{{.TASK}}.out
```

Literal output paths may be declared before the files exist. Patterns are
expanded against the filesystem, and may use the same glob syntax as
`matches`.

`subst`, `matches`, and `yields` can be combined in one transform. See
[Lua](../lua.md#transform) for accessing these paths in version 42.
