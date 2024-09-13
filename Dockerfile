FROM --platform=$BUILDPLATFORM  golang:latest AS builder
WORKDIR /app

ARG TARGETOS TARGETARCH
ARG DERP_VERSION=latest
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH CGO_ENABLED=0 \
    go install -ldflags="-w -s" -trimpath  tailscale.com/cmd/derper@${DERP_VERSION}

FROM scratch
ARG TARGETOS TARGETARCH

WORKDIR /app
COPY --from=builder /etc/ssl/certs/ca-certificates.crt  /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /go/bin/${TARGETOS}_${TARGETARCH}/derper /app/derper

ENTRYPOINT ["/app/derper"]
