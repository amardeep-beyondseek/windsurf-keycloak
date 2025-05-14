FROM quay.io/keycloak/keycloak:latest

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-d0hv6bemcj7s739hscc0-a:5432/keycloak_l3wn
ENV KC_DB_USERNAME=keycloak_l3wn_user
ENV KC_DB_PASSWORD=exBGAs0x5CDliJCt6vbmDZApVkcVLV0m

# Configure proxy and HTTP
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true

# Start Keycloak in development mode for easier setup
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
