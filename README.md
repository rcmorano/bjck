# bjck

Minimal Alpine-based container image with:

- bash
- curl
- jq
- kubectl

## Image

The image is built from the repository `Dockerfile` and intended to be published to GitHub Container Registry (GHCR).

Example pull command:

```bash
docker pull ghcr.io/rcmorano/bjck:latest
```

## Local build

```bash
docker build -t bjck:local .
```

## Run locally

```bash
docker run --rm -it bjck:local
```

## Contents

- Alpine Linux base image
- `bash`
- `curl`
- `jq`
- `kubectl`

## Contributing

Contributions are welcome.

Typical workflow:

1. Fork the repository.
2. Create a feature branch.
3. Make your change and keep it focused.
4. Test the image locally:
   ```bash
   docker build -t bjck:test .
   ```
5. Open a pull request with a clear description of the change.

Please try to:

- keep changes minimal and easy to review
- explain the motivation for the change
- update documentation when behavior changes
- ensure container builds continue to work

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.
