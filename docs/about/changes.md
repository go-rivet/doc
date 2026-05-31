
# Changes

Rivet introduces the following changes to the upstream Task project:

| Change | Area | Description |
| :--- | :--- | :--- |
| **Removed** | Experiments | Reduction in complexity. |
| **Removed** | TUI | Not within scope for minimal task runner. Integrators can provide. |
| **Removed** | taskrc files | Reduction in complexity. |
| **Removed** | Completion | Not within scope for minimal task runner. Integrators can provide. |
| **New**&nbsp;:lucide-rocket: | Logging | Implemented with `log/slog`. Supports legacy, text, and JSON formats. |
| **Removed** | silent (CLI Flag) | Flag removed. Silent execution is now the default log state. |
| **Removed** | silent (Schema) | Removed from schema. Additional filtering via structured log formats (JSON). |
| **New**&nbsp;:lucide-rocket: | verbose (CLI Flag) | Controls log levels across 4 tiers: None, Info, Debug, and Trace. |
| **Removed** | env (Schema) | Removed from schema. |
| **New**&nbsp;:lucide-rocket: | Vars | Both `vars` and `env` are unified into `vars`. |
