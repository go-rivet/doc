# CLI

## Usage

```sh
rivet [OPTIONS] [tasks...] [-- ARGS]
```

## Options

### Display/Help flags

| Option | Short | Description |
| :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--version`</span> |  | Show Task version. |
| <span style="white-space: nowrap;">`--help`</span> | `-h` | Shows Task usage. |
| <span style="white-space: nowrap;">`--init`</span> | `-i` | Creates a new Taskfile.yml in the current folder. |

### List flags

| Option | Short | Description |
| :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--list`</span> | `-l` | Lists tasks with description of current Taskfile. |
| <span style="white-space: nowrap;">`--list-all`</span> | `-a` | Lists tasks with or without a description. |
| <span style="white-space: nowrap;">`--json`</span> | `-j` | Formats task list as JSON. |
| <span style="white-space: nowrap;">`--sort <format>`</span> |  | Changes the order of the tasks when listed. [default|alphanumeric|none]. |
| <span style="white-space: nowrap;">`--status`</span> |  | Exits with non-zero exit code if any of the given tasks is not up-to-date. |
| <span style="white-space: nowrap;">`--no-status`</span> |  | Ignore status when listing tasks as JSON |
| <span style="white-space: nowrap;">`--nested`</span> |  | Nest namespaces when listing tasks as JSON |

### Execution flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--parallel`</span> | `-p` |  | Executes tasks provided on command line in parallel. |
| <span style="white-space: nowrap;">`--concurrency <value>`</span> | `-C` | <span style="white-space: nowrap;">`RIVET_CONCURRENCY`</span> | Limit number of tasks to run concurrently. |
| <span style="white-space: nowrap;">`--dry`</span> | `-n` | <span style="white-space: nowrap;">`RIVET_DRY`</span> | Compiles and prints tasks in the order that they would be run, without executing them. |
| <span style="white-space: nowrap;">`--summary`</span> |  |  | Show summary about a task. |
| <span style="white-space: nowrap;">`--exit-code`</span> | `-x` |  | Pass-through the exit code of the task command. |
| <span style="white-space: nowrap;">`--failfast`</span> | `-F` | <span style="white-space: nowrap;">`RIVET_FAILFAST`</span> | When running tasks in parallel, stop all tasks if one fails. |
| <span style="white-space: nowrap;">`--force`</span> |  |  | Forces execution of a task even when up-to-date. |
| <span style="white-space: nowrap;">`--force-all`</span> | `-f` |  | Forces execution even when the task is up-to-date. |

### Directory flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--dir <value>`</span> | `-d` |  | Sets the directory in which Task will execute and look for a Taskfile. |
| <span style="white-space: nowrap;">`--taskfile <value>`</span> | `-t` | <span style="white-space: nowrap;">`RIVET_TASKFILE`</span> | Choose which Taskfile to run. |
| <span style="white-space: nowrap;">`--global`</span> | `-g` |  | Runs global Taskfile, from $HOME/{T,t}askfile.{yml,yaml}. |

### Watch flags

| Option | Short | Description |
| :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--watch`</span> | `-w` | Enables watch of the given task. |
| <span style="white-space: nowrap;">`--interval <value>`</span> | `-I` | Interval to watch for changes. |

### Logging flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--verbose <level>`</span> |  |  | Log verbosity level [info|debug|trace] or cumulative shorthand [-v|-vv|-vvv] |
| <span style="white-space: nowrap;">`--log <format>`</span> |  |  | Log format ("otel", "json", or "text"). |
| <span style="white-space: nowrap;">`--color`</span> | `-c` | <span style="white-space: nowrap;">`RIVET_COLOR`</span> | Colored output. Enabled by default. Set flag to false or use NO_COLOR=1 to disable. |

### Output flags

| Option | Env | Description |
| :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--output <value>`</span> | <span style="white-space: nowrap;">`RIVET_OUTPUT`</span> | Output configuration. |
| <span style="white-space: nowrap;">`--group-begin <value>`</span> | <span style="white-space: nowrap;">`RIVET_OUTPUT_GROUP_BEGIN`</span> | Group output beginning text. |
| <span style="white-space: nowrap;">`--group-end <value>`</span> | <span style="white-space: nowrap;">`RIVET_OUTPUT_GROUP_END`</span> | Group output end text. |
| <span style="white-space: nowrap;">`--group-error-only`</span> | <span style="white-space: nowrap;">`RIVET_OUTPUT_GROUP_ERROR_ONLY`</span> | Print group output only on error. |

### Interaction flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--disable-fuzzy`</span> |  | <span style="white-space: nowrap;">`RIVET_DISABLE_FUZZY`</span> | Disables fuzzy matching for task names. |
| <span style="white-space: nowrap;">`--yes`</span> | `-y` | <span style="white-space: nowrap;">`RIVET_ASSUME_YES`</span> | Assume "yes" as answer to all prompts. |
| <span style="white-space: nowrap;">`--interactive`</span> |  | <span style="white-space: nowrap;">`RIVET_INTERACTIVE`</span> | Prompt for missing required variables. |

### Remote Taskfile flags

| Option | Env | Description |
| :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--download`</span> |  | Downloads a cached version of a remote Taskfile. |
| <span style="white-space: nowrap;">`--offline`</span> | <span style="white-space: nowrap;">`RIVET_OFFLINE`</span> | Forces Task to only use local or cached Taskfiles. |
| <span style="white-space: nowrap;">`--insecure`</span> | <span style="white-space: nowrap;">`RIVET_INSECURE`</span> | Forces Task to download Taskfiles over insecure connections. |
| <span style="white-space: nowrap;">`--trusted-hosts <value>`</span> | <span style="white-space: nowrap;">`RIVET_TRUSTED_HOSTS`</span> | List of trusted hosts for remote Taskfiles (comma-separated). |
| <span style="white-space: nowrap;">`--timeout <value>`</span> | <span style="white-space: nowrap;">`RIVET_TIMEOUT`</span> | Timeout for downloading remote Taskfiles. |
| <span style="white-space: nowrap;">`--clear-cache`</span> |  | Clear the remote cache. |
| <span style="white-space: nowrap;">`--expiry <value>`</span> | <span style="white-space: nowrap;">`RIVET_CACHE_EXPIRY_DURATION`</span> | Expiry duration for cached remote Taskfiles. |
| <span style="white-space: nowrap;">`--remote-cache <value>`</span> | <span style="white-space: nowrap;">`RIVET_REMOTE_CACHE_DIR`</span> | Directory to cache remote Taskfiles. |

### TLS/Certificate flags

| Option | Env | Description |
| :--- | :--- | :--- |
| <span style="white-space: nowrap;">`--cacert <value>`</span> | <span style="white-space: nowrap;">`RIVET_C_A_CERT`</span> | Path to a custom CA certificate for HTTPS connections. |
| <span style="white-space: nowrap;">`--cert <value>`</span> | <span style="white-space: nowrap;">`RIVET_CERT`</span> | Path to a client certificate for HTTPS connections. |
| <span style="white-space: nowrap;">`--cert-key <value>`</span> | <span style="white-space: nowrap;">`RIVET_CERT_KEY`</span> | Path to a client certificate key for HTTPS connections. |

## Examples

### version

```bash
rivet --version

# Expected output:
Rivet v0.2.0
Commit: ffc9bc74
Built:  2026-05-17T12:32:58Z
```
