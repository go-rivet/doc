# Global

The top-level Taskfile schema controls configuration shared by all tasks.

```yaml
version: '3'

vars: {}
tasks: {}
```

- `version`: Taskfile schema version. The current version is `3`.
- `output`: Output style and grouping configuration.
- `includes`: Other Taskfiles to load, including their namespace and options.
- `set`: Shell options applied to tasks.
- `shopt`: Bash shell options applied to tasks.
- `vars`: Variables available to tasks.
- `tasks`: Named task definitions.
- `dotenv`: Dotenv files to load.
- `run`: Default task run mode.
- `interval`: Default watch interval.
