# Command

Command entries may be a command string or a mapping with these fields:

- `cmd`: Shell command to execute.
- `lua`: Lua script to execute.
- `task`: Another task to call.
- `set`, `shopt`, `vars`: Command-local execution context.
- `ignore_error`, `defer`, `platforms`: Error, deferred, and platform behavior.

A command may contain either `lua`, `cmd`, or `task` fields (one only).
Lua commands cannot be deferred.

See [Lua](../lua.md) for using Lua commands.
