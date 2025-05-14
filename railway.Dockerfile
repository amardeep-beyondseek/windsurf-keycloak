FROM bitnami/keycloak:latest

# Set default environment variables
ENV KEYCLOAK_HTTP_PORT=8080
ENV KEYCLOAK_HTTPS_PORT=8443
ENV KEYCLOAK_PROXY=edge
ENV KEYCLOAK_PRODUCTION=false

# Expose port
EXPOSE 8080

# Healthcheck
HEALTHCHECK --interval=30s --timeout=15s --start-period=60s \
  CMD curl -f http://localhost:8080/health/ready || exit 1
