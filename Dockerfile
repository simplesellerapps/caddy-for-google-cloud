FROM caddy:2.6.2-builder AS builder

RUN xcaddy build --with github.com/leodido/caddy-jsonselect-encoder --with github.com/grafana/certmagic-gcs --with github.com/caddy-dns/cloudflare

FROM caddy:2.6.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY gcp.caddyfile /etc/caddy/gcp.caddyfile