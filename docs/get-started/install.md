
# Install

## Linux/Darwin

### Automated Install Script

```bash title="Install latest version of Rivet"
curl -sSL https://raw.githubusercontent.com/go-rivet/rivet/main/install.sh | sh
```

```bash title="Install a specific version of Rivet"
RIVET_VERSION="v0.2.0" curl -sSL https://raw.githubusercontent.com/go-rivet/rivet/main/install.sh | sh
```


## Docker

### Scratch Docker Image

```bash title="Extract binary from scratch"
docker create --name temp-rivet ghcr.io/go-rivet/rivet:latest
docker cp temp-rivet:/rivet ./rivet
docker rm temp-rivet

./rivet --version

# Expected output:
Rivet v0.2.0
Commit: ffc9bc74
Built:  2026-05-17T12:32:58Z
```

### Alpine Docker Image

```bash title="Run via interactive shell"
docker run --rm -it ghcr.io/go-rivet/rivet:latest-alpine
```

## Windows

!!! info

    To be determined.

## From Code

```bash title="Install direct from code"
git clone https://github.com/go-rivet/rivet.git
cd rivet
make build
make install

rivet --version

# Expected output:
Rivet v0.2.0
Commit: ffc9bc74
Built:  2026-05-17T12:32:58Z
```

