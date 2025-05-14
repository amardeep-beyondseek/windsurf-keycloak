FROM quay.io/keycloak/keycloak:latest as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

# Configure a database
ENV KC_DB_URL=postgres://keycloak_l3wn_user:exBGAs0x5CDliJCt6vbmDZApVkcVLV0m@dpg-d0hv6bemcj7s739hscc0-a:5432/keycloak_l3wn
ENV KC_DB_USERNAME=keycloak_l3wn_user
ENV KC_DB_PASSWORD=exBGAs0x5CDliJCt6vbmDZApVkcVLV0m

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database
ENV KC_DB=postgres
ENV KC_DB_URL=postgres://keycloak_l3wn_user:exBGAs0x5CDliJCt6vbmDZApVkcVLV0m@dpg-d0hv6bemcj7s739hscc0-a:5432/keycloak_l3wn
ENV KC_DB_USERNAME=keycloak_l3wn_user
ENV KC_DB_PASSWORD=exBGAs0x5CDliJCt6vbmDZApVkcVLV0m

# Configure HTTPS
ENV KC_HTTPS_CERTIFICATE_FILE=/opt/keycloak/conf/server.crt.pem
ENV KC_HTTPS_CERTIFICATE_KEY_FILE=/opt/keycloak/conf/server.key.pem

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
