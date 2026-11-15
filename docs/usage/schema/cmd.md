# Command

Command entries may be a command string or a mapping with these fields:

- `cmd`: Shell command to execute.
- `lua`: Lua script to execute in a version 42 Taskfile.
- `task`: Another task to call.
- `set`, `shopt`, `vars`: Command-local execution context.
- `ignore_error`, `defer`, `platforms`: Error, deferred, and platform behavior.

A command may contain `lua`, `cmd`, or `task`, but not more than one.
Lua commands cannot be deferred.

See [Lua](../lua.md) for using Lua commands.
