
# Changes

!!! info

	Items in the changes list are in reverse chronological order (most recent changes first).

Rivet introduces the following changes to the upstream Task project:

| Change | Area | Description |
| :--- | :--- | :--- |
| **New**&nbsp;:lucide-rocket: | Transform | Makefile like `subst` pattern for efficient transform definition. |
| **New**&nbsp;:lucide-rocket: | Transform | Express a tasks sources and targets as a `transform` with `matches` and `yields`. |
| **Refactored**&nbsp;:lucide-rocket: | CLI Flags | Redesign of flag mechanism (removes pflag dep) with support for doc generation. |
| **New**&nbsp;:lucide-rocket: | Fingerprint | Speedup for Timestamp fingerprint method. |
| **Refactored**&nbsp;:lucide-rocket: | Fingerprint | Simplified operation, always runs, `force` to override. As a result the schema item `method` is removed. |
| **Removed**&nbsp;:lucide-rocket: | Fingerprint | Removed checksum fingerprint method. |
| **New**&nbsp;:lucide-rocket: | Templater | Sprig functions are refactored into the Rivet codebase. |
| **New**&nbsp;:lucide-rocket: | Vars | Both `vars` and `env` are unified into `vars`. |
| **Removed** | env (Schema) | Removed from schema. |
| **New**&nbsp;:lucide-rocket: | verbose (CLI Flag) | Controls log levels across 4 tiers: None, Info, Debug, and Trace. |
| **Removed** | silent (Schema) | Removed from schema. Additional filtering via structured log formats (JSON). |
| **Removed** | silent (CLI Flag) | Flag removed. Silent execution is now the default log state. |
| **New**&nbsp;:lucide-rocket: | Logging | Implemented with `log/slog`. Supports legacy, text, and JSON formats. |
| **Removed** | Completion | Not within scope for minimal task runner. Integrators can provide. |
| **Removed** | taskrc files | Reduction in complexity. |
| **Removed** | TUI | Not within scope for minimal task runner. Integrators can provide. |
| **Removed** | Experiments | Reduction in complexity. |