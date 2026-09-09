# Command

Command entries may be a command string or a mapping with these fields:

- `cmd`: Shell command to execute.
- `task`: Another task to call.
- `for`: Values over which to repeat the command.
- `if`: Condition for running the command.
- `set`, `shopt`, `vars`: Command-local execution context.
- `ignore_error`, `defer`, `platforms`: Error, deferred, and platform behavior.
