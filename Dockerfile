FROM alpine:3.22

RUN apk add --no-cache \
    bash \
    curl \
    jq

ARG KUBECTL_VERSION=v1.33.0

RUN ARCH="$(apk --print-arch)" && \
    case "$ARCH" in \
      x86_64) K8S_ARCH="amd64" ;; \
      aarch64) K8S_ARCH="arm64" ;; \
      armv7) K8S_ARCH="arm" ;; \
      *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;; \
    esac && \
    curl -fsSLo /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${K8S_ARCH}/kubectl" && \
    curl -fsSLo /tmp/kubectl.sha256 "https://dl.k8s.io/${KUBECTL_VERSION}/bin/linux/${K8S_ARCH}/kubectl.sha256" && \
    echo "$(cat /tmp/kubectl.sha256)  /usr/local/bin/kubectl" | sha256sum -c - && \
    chmod +x /usr/local/bin/kubectl && \
    rm -f /tmp/kubectl.sha256

CMD ["bash"]
