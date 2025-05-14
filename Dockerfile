FROM quay.io/keycloak/keycloak:latest as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

# Configure a database
ENV KC_DB_URL=postgres://postgres:postgres@postgres:5432/keycloak
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=postgres

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database
ENV KC_DB=postgres
ENV KC_DB_URL=postgres://postgres:postgres@postgres:5432/keycloak
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=postgres

# Configure HTTPS
ENV KC_HTTPS_CERTIFICATE_FILE=/opt/keycloak/conf/server.crt.pem
ENV KC_HTTPS_CERTIFICATE_KEY_FILE=/opt/keycloak/conf/server.key.pem

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
