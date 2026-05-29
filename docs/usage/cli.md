
# CLI

## Usage

```sh
rivet [OPTIONS]
```

## Options

| Option | Short | Description |
| :--- | :--- | :--- |
| `--help`            | `-h` | Display help information for commands. |
| `--version`         |      | Display the version of the Rivet binary. |
| `--log <format>`    |      | Set log format. Choices: `text`, `json` (default is unformatted). |
| `--verbose <level>` | `-v` | Enable verbose logging. Stack flags to increase depth:<br>• `-v` : `info`<br>• `-vv` : `debug`<br>• `-vvv` : `trace` |

## Examples

### version

```bash
rivet --version

# Expected output:
Rivet v0.2.0
Commit: ffc9bc74
Built:  2026-05-17T12:32:58Z
```