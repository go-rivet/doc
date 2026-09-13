# Configuration

Rivet can be configured using environment variables to control task execution, output formatting, and connection settings. These variables can be set directly in your environment or defined inside `.env` configuration files, which Rivet automatically discovers and loads.

## Environment

| Variable | Description |
| :--- | :--- |
| <span style="white-space: nowrap;">`RIVET_ASSUME_YES`</span> | Assume "yes" as answer to all prompts. |
| <span style="white-space: nowrap;">`RIVET_CACHE_EXPIRY_DURATION`</span> | Expiry duration for cached remote Taskfiles. |
| <span style="white-space: nowrap;">`RIVET_CERT_KEY`</span> | Path to a client certificate key for HTTPS connections. |
| <span style="white-space: nowrap;">`RIVET_CERT`</span> | Path to a client certificate for HTTPS connections. |
| <span style="white-space: nowrap;">`RIVET_COLOR`</span> | Colored output. Enabled by default. Set flag to false or use NO_COLOR=1 to disable. |
| <span style="white-space: nowrap;">`RIVET_CONCURRENCY`</span> | Limit number of tasks to run concurrently. |
| <span style="white-space: nowrap;">`RIVET_C_A_CERT`</span> | Path to a custom CA certificate for HTTPS connections. |
| <span style="white-space: nowrap;">`RIVET_DISABLE_FUZZY`</span> | Disables fuzzy matching for task names. |
| <span style="white-space: nowrap;">`RIVET_DRY`</span> | Compiles and prints tasks in the order that they would be run, without executing them. |
| <span style="white-space: nowrap;">`RIVET_FAILFAST`</span> | When running tasks in parallel, stop all tasks if one fails. |
| <span style="white-space: nowrap;">`RIVET_INSECURE`</span> | Forces Task to download Taskfiles over insecure connections. |
| <span style="white-space: nowrap;">`RIVET_INTERACTIVE`</span> | Prompt for missing required variables. |
| <span style="white-space: nowrap;">`RIVET_OFFLINE`</span> | Forces Task to only use local or cached Taskfiles. |
| <span style="white-space: nowrap;">`RIVET_OUTPUT_GROUP_BEGIN`</span> | Group output beginning text. |
| <span style="white-space: nowrap;">`RIVET_OUTPUT_GROUP_END`</span> | Group output end text. |
| <span style="white-space: nowrap;">`RIVET_OUTPUT_GROUP_ERROR_ONLY`</span> | Print group output only on error. |
| <span style="white-space: nowrap;">`RIVET_OUTPUT`</span> | Output configuration. |
| <span style="white-space: nowrap;">`RIVET_REMOTE_CACHE_DIR`</span> | Directory to cache remote Taskfiles. |
| <span style="white-space: nowrap;">`RIVET_TASKFILE`</span> | Choose which Taskfile to run. |
| <span style="white-space: nowrap;">`RIVET_TIMEOUT`</span> | Timeout for downloading remote Taskfiles. |
| <span style="white-space: nowrap;">`RIVET_TRUSTED_HOSTS`</span> | List of trusted hosts for remote Taskfiles (comma-separated). |


## Config Files

Rivet may be configured with standard .env files. Configuration files are evaluated in order of precedence from highest to lowest:

| Priority | Source / Scope | Location or Variable |
| :---: | :--- | :--- |
| 1 | Explicit Environment Override | `$RIVET_ENV` |
| 2 | Local Workspace (Visible) | `./rivet.env` |
| 3 | Local Workspace (Hidden) | `./.rivet.env` |
| 4 | Taskfile Directory (Visible) | `rivet.env` |
| 5 | Taskfile Directory (Hidden) | `.rivet.env` |
| 6 | Modern Linux XDG Config Path | `~/.config/rivet/rivet.env` |
| 7 | Legacy User Home Directory | `~/.rivet.env` |


## Examples

### Docker Compose

__Config file__
```ini
# config/rivet.env
RIVET_TASKFILE=/etc/rivet/Taskfile.yml
```

__Taskfile__
```yaml
# tasks/Taskfile.yml
version: '3'

tasks:
  default:
    cmds:
      - echo "Hello, World!"
```

__Docker Compose__
```yaml
# docker-compose.yml
version: '3.8'

services:
  rivet:
    image: ghcr.io/go-rivet/rivet:latest
    environment:
      - RIVET_ENV=/etc/rivet/rivet.env
    volumes:
      - ./config/rivet.env:/etc/rivet/rivet.env:ro
      - ./tasks/Taskfile.yml:/etc/rivet/Taskfile.yml:ro
    working_dir: /etc/rivet
```
