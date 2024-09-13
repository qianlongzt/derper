# Derper

![workflow](https://github.com/qianlongzt/derper-docker/actions/workflows/docker-image.yml/badge.svg)

# Setup

> required: set `--hostname` to your domain

```bash
docker run -p 80:80 -p 443:443 -p 3478:3478/udp ghcr.io/qianlongzt/derper --hostname=derper.example.com
```

# Usage

`docker run --rm ghcr.io/qianlongzt/derper --help`

Fully DERP setup official documentation: https://tailscale.com/kb/1118/custom-derp-servers/

https://github.com/tailscale/tailscale/blob/main/cmd/derper/derper.go#L51

## Client verification

In order to use `-verify-clients`, the container needs access to Tailscale's Local API, which can usually be accessed through `/var/run/tailscale/tailscaled.sock`. 

If you're running Tailscale bare-metal on Linux, adding -v /var/run/:/var/run/:ro to the docker run command should be sufficient. You cannot use /var/run/tailscale because Tailscale will recreate it.

