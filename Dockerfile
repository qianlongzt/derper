FROM --platform=$BUILDPLATFORM  golang:latest AS builder
WORKDIR /app

ARG TARGETOS TARGETARCH
ARG DERP_VERSION=latest
RUN go version
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH CGO_ENABLED=0 \
    go install -ldflags="-w -s" -trimpath  tailscale.com/cmd/derper@${DERP_VERSION}
RUN if [ -f /go/bin/*_*/* ];then mv /go/bin/*_*/* /go/bin && rm -rf /go/bin/*_*; fi

FROM scratch

WORKDIR /app
COPY --from=builder /etc/ssl/certs/ca-certificates.crt  /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /go/bin/derper /app/derper

ENTRYPOINT ["/app/derper"]
