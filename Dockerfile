FROM bitnami/keycloak:latest

# Configure database
ENV KEYCLOAK_DATABASE_HOST=dpg-d0hv6bemcj7s739hscc0-a
ENV KEYCLOAK_DATABASE_PORT=5432
ENV KEYCLOAK_DATABASE_NAME=keycloak_l3wn
ENV KEYCLOAK_DATABASE_USER=keycloak_l3wn_user
ENV KEYCLOAK_DATABASE_PASSWORD=exBGAs0x5CDliJCt6vbmDZApVkcVLV0m

# Configure Keycloak
ENV KEYCLOAK_HTTP_PORT=10000
ENV KEYCLOAK_HTTPS_PORT=8443
ENV KEYCLOAK_PROXY=edge
ENV KEYCLOAK_PRODUCTION=false
ENV KEYCLOAK_HTTP_RELATIVE_PATH=/
ENV KEYCLOAK_EXTRA_ARGS="--http-port=10000"

# Expose port
EXPOSE 10000

# Health check
HEALTHCHECK --interval=30s --timeout=15s --start-period=60s \
  CMD curl -f http://localhost:10000/health/ready || exit 1

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
