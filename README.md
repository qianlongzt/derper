# Derper

[![docker workflow](https://github.com/fredliang44/derper-docker/actions/workflows/docker-image.yml/badge.svg)](https://hub.docker.com/r/fredliang/derper)
[![docker pulls](https://img.shields.io/docker/pulls/fredliang/derper.svg?color=brightgreen)](https://hub.docker.com/r/fredliang/derper)
[![platform](https://img.shields.io/badge/platform-amd64%20%7C%20arm64-brightgreen)](https://hub.docker.com/r/fredliang/derper/tags)

# Setup

> required: set `--hostname` to your domain

```bash
docker run -p 80:80 -p 443:443 -p 3478:3478/udp fredliang/derper --hostname=derper.example.com
```

# Usage

`docker run --rm fredliang/derper --help`

Fully DERP setup offical documentation: https://tailscale.com/kb/1118/custom-derp-servers/

## Client verification

In order to use `-verify-clients`, the container needs access to Tailscale's Local API, which can usually be accessed through `/var/run/tailscale/tailscaled.sock`. If you're running Tailscale bare-metal on Linux, adding this to the `docker run` command should be enough: `-v /var/run/tailscale/tailscaled.sock:/var/run/tailscale/tailscaled.sock`
