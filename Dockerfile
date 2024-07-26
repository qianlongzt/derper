FROM golang:latest AS builder
WORKDIR /app

ARG DERP_VERSION=latest
RUN CGO_ENABLED=0 go install -ldflags="-w -s" -trimpath tailscale.com/cmd/derper@${DERP_VERSION}

FROM scratch

WORKDIR /app
COPY --from=builder  /etc/ssl/certs/ca-certificates.crt  /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /go/bin/derper /app/derper

ENTRYPOINT ["/app/derper"]
