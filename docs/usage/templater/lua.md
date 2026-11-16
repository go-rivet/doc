---
title: Lua Functions
sidebar_label: Lua
---

# Lua Functions

Lua scripts can use Lua 5.4 standard libraries and the Rivet wrappers below.
The native functions listed are useful counterparts to template functions,
but may differ in arguments or behavior.

### File Path

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.absPath`** | `(path) -> string` |
| **`rivet.fn.fromSlash`** | `(path) -> string` |
| **`rivet.fn.joinPath`** | `(...parts) -> string` |
| **`rivet.fn.patsubst`** | `(oldExt, newExt, paths) -> sequence` |
| **`rivet.fn.relPath`** | `(base, target) -> string` |
| **`rivet.fn.toSlash`** | `(path) -> string` |

### Serialization

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.fromYaml`** | `(text) -> value` |
| **`rivet.fn.toYaml`** | `(value) -> string` |

Both YAML wrappers raise errors, like the template `mustFromYaml` and
`mustToYaml` functions.

### Shell Tokenization

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.shellQuote`** | `(text) -> string` |
| **`rivet.fn.splitArgs`** | `(text) -> sequence` |

`shellQuote` quotes for Bash.

### String Manipulation

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.catLines`** | `(text) -> string` |
| **`rivet.fn.split`** | `(text, separator) -> sequence` |
| **`rivet.fn.splitLines`** | `(text) -> sequence` |
| **`string.find`** | `(text, pattern [, init [, plain]]) -> indices` |
| **`string.format`** | `(format, ...values) -> string` |
| **`string.gsub`** | `(text, pattern, replacement [, n]) -> string, count` |
| **`string.len`** | `(text) -> integer` |
| **`string.lower`** | `(text) -> string` |
| **`string.match`** | `(text, pattern [, init]) -> captures` |
| **`string.rep`** | `(text, count [, separator]) -> string` |
| **`string.reverse`** | `(text) -> string` |
| **`string.sub`** | `(text, start [, finish]) -> string` |
| **`string.upper`** | `(text) -> string` |
| **`tostring`** | `(value) -> string` |

`rivet.fn.split` trims and discards empty parts; unlike Sprig `split`, it
returns a sequence. Lua patterns are not regular expressions; `string.sub`
uses one-based, inclusive indices. `string.lower`, `string.upper`, and
`string.rep` correspond to `lower`, `upper`, and `repeat`.

### List and Data Structure

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.merge`** | `(base, ...maps) -> map` |
| **`table.concat`** | `(list [, separator [, start [, finish]]]) -> string` |
| **`table.insert`** | `(list, [position,] value)` |
| **`table.remove`** | `(list [, position]) -> value` |
| **`table.sort`** | `(list [, compare])` |

Lua tables represent lists and maps. `rivet.fn.merge` returns a new map;
`table.insert`, `table.remove`, and `table.sort` modify the input table;
`table.concat` corresponds to `join`.

### Numerical

| Function | Lua Signature |
| :--- | :--- |
| **`math.ceil`** | `(number) -> number` |
| **`math.floor`** | `(number) -> number` |
| **`math.max`** | `(number, ...numbers) -> number` |
| **`math.min`** | `(number, ...numbers) -> number` |
| **`math.random`** | `([upper])` or `(lower, upper) -> number` |
| **`tonumber`** | `(value [, base]) -> number or nil` |

`math.random(lower, upper)` includes both endpoints; template `randInt`
excludes the upper endpoint. Lua also provides arithmetic operators.

### Date and Environment

| Function | Lua Signature |
| :--- | :--- |
| **`os.date`** | `([format [, time]]) -> string or table` |
| **`os.getenv`** | `(name) -> string or nil` |
| **`os.time`** | `([table]) -> integer` |

`os.date` uses Lua's date formats, not Go's template date layouts.
`os.getenv` reads the process environment; use `ctx.vars` for task variables.

### System

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.ARCH`** | `() -> string` |
| **`rivet.fn.OS`** | `() -> string` |
| **`rivet.fn.exeExt`** | `() -> string` |
| **`rivet.fn.numCPU`** | `() -> integer` |
| **`rivet.fn.uuid`** | `() -> string` |

### Utility

| Function | Lua Signature |
| :--- | :--- |
| **`rivet.fn.joinEnv`** | `(...parts) -> string` |
| **`rivet.fn.joinUrl`** | `(...parts) -> string` |
| **`error`** | `(message [, level])` |
| **`pcall`** | `(function, ...args) -> success, ...results` |
| **`type`** | `(value) -> string` |

Rivet wrapper errors can be caught with `pcall`. Other Task and Sprig functions
do not have `rivet.fn` wrappers. See the [Lua 5.4 reference manual](https://www.lua.org/manual/5.4/)
for all standard-library functions.
