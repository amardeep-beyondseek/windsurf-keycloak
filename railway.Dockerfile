FROM quay.io/keycloak/keycloak:latest

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

# Configure proxy and HTTP
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false

# Expose port
EXPOSE 8080

# Start in development mode for easier setup
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
