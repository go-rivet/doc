# CLI

## Usage

```sh
rivet [OPTIONS] [tasks...] [-- ARGS]
```

## Options

### Display/Help flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--version` |  |  | Show Task version. |
| `--help` | `-h` |  | Shows Task usage. |
| `--init` | `-i` |  | Creates a new Taskfile.yml in the current folder. |

### List flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--list` | `-l` |  | Lists tasks with description of current Taskfile. |
| `--list-all` | `-a` |  | Lists tasks with or without a description. |
| `--json` | `-j` |  | Formats task list as JSON. |
| `--sort <format>` |  |  | Changes the order of the tasks when listed. [default|alphanumeric|none]. |
| `--status` |  |  | Exits with non-zero exit code if any of the given tasks is not up-to-date. |
| `--no-status` |  |  | Ignore status when listing tasks as JSON |
| `--nested` |  |  | Nest namespaces when listing tasks as JSON |

### Execution flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--watch` | `-w` |  | Enables watch of the given task. |
| `--parallel` | `-p` |  | Executes tasks provided on command line in parallel. |
| `--dry` | `-n` | `RIVET_DRY` | Compiles and prints tasks in the order that they would be run, without executing them. |
| `--summary` |  |  | Show summary about a task. |
| `--exit-code` | `-x` |  | Pass-through the exit code of the task command. |
| `--failfast` | `-F` | `RIVET_FAILFAST` | When running tasks in parallel, stop all tasks if one fails. |
| `--force` |  |  | Forces execution of a task even when up-to-date. |
| `--force-all` | `-f` |  | Forces execution even when the task is up-to-date. |

### Logging flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--verbose <level>` |  |  | Log verbosity level [info|debug|trace] or cumulative shorthand [-v|-vv|-vvv] |
| `--log <format>` |  |  | Log format ("json" or "text"). |
| `--color` | `-c` | `RIVET_COLOR` | Colored output. Enabled by default. Set flag to false or use NO_COLOR=1 to disable. |

### Directory flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--dir <value>` | `-d` |  | Sets the directory in which Task will execute and look for a Taskfile. |
| `--taskfile <value>` | `-t` |  | Choose which Taskfile to run. Defaults to "Taskfile.yml". |
| `--global` | `-g` |  | Runs global Taskfile, from $HOME/{T,t}askfile.{yml,yaml}. |

### Output flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--output <value>` |  | `RIVET_OUTPUT` | Output configuration. |
| `--group-begin <value>` |  | `RIVET_OUTPUT_GROUP_BEGIN` | Group output beginning text. |
| `--group-end <value>` |  | `RIVET_OUTPUT_GROUP_END` | Group output end text. |
| `--group-error-only` |  | `RIVET_OUTPUT_GROUP_ERROR_ONLY` | Print group output only on error. |

### Concurrency flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--concurrency <value>` | `-C` | `RIVET_CONCURRENCY` | Limit number of tasks to run concurrently. |
| `--interval <value>` | `-I` |  | Interval to watch for changes. |

### Interaction flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--disable-fuzzy` |  | `RIVET_DISABLE_FUZZY` | Disables fuzzy matching for task names. |
| `--yes` | `-y` | `RIVET_ASSUME_YES` | Assume "yes" as answer to all prompts. |
| `--interactive` |  | `RIVET_INTERACTIVE` | Prompt for missing required variables. |

### Security flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--insecure` |  | `RIVET_INSECURE` | Forces Task to download Taskfiles over insecure connections. |

### Remote Taskfile flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--download` |  |  | Downloads a cached version of a remote Taskfile. |
| `--offline` |  | `RIVET_OFFLINE` | Forces Task to only use local or cached Taskfiles. |
| `--trusted-hosts <value>` |  | `RIVET_TRUSTED_HOSTS` | List of trusted hosts for remote Taskfiles (comma-separated). |
| `--timeout <value>` |  | `RIVET_TIMEOUT` | Timeout for downloading remote Taskfiles. |
| `--clear-cache` |  |  | Clear the remote cache. |
| `--expiry <value>` |  | `RIVET_CACHE_EXPIRY_DURATION` | Expiry duration for cached remote Taskfiles. |
| `--remote-cache <value>` |  | `RIVET_REMOTE_CACHE_DIR` | Directory to cache remote Taskfiles. |

### TLS/Certificate flags

| Option | Short | Env | Description |
| :--- | :--- | :--- | :--- |
| `--cacert <value>` |  | `RIVET_C_A_CERT` | Path to a custom CA certificate for HTTPS connections. |
| `--cert <value>` |  | `RIVET_CERT` | Path to a client certificate for HTTPS connections. |
| `--cert-key <value>` |  | `RIVET_CERT_KEY` | Path to a client certificate key for HTTPS connections. |

## Examples

### version

```bash
rivet --version

# Expected output:
Rivet v0.2.0
Commit: ffc9bc74
Built:  2026-05-17T12:32:58Z
```
