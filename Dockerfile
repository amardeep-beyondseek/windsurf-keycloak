FROM quay.io/keycloak/keycloak:21.1.1

# Create a directory for health check
RUN mkdir -p /opt/keycloak/health

# Add a health check script
RUN echo '#!/bin/bash\ncurl -f http://localhost:8080/health/ready || exit 1' > /opt/keycloak/health/healthcheck.sh \
    && chmod +x /opt/keycloak/health/healthcheck.sh

# Configure database
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0hv6bemcj7s739hscc0-a:5432/keycloak_l3wn
ENV KC_DB_USERNAME=keycloak_l3wn_user
ENV KC_DB_PASSWORD=exBGAs0x5CDliJCt6vbmDZApVkcVLV0m

# Configure proxy and HTTP
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false

# Expose port
EXPOSE 8080

# Build optimized for production
RUN /opt/keycloak/bin/kc.sh build

# Start in development mode for easier setup
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
