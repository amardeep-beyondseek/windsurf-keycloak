FROM jboss/keycloak:latest

# Add a health check script
RUN echo '#!/bin/bash\ncurl -f http://localhost:8080/auth/realms/master || exit 1' > /opt/jboss/healthcheck.sh \
    && chmod +x /opt/jboss/healthcheck.sh

# Configure database
ENV DB_VENDOR=postgres
ENV DB_ADDR=dpg-d0hv6bemcj7s739hscc0-a
ENV DB_PORT=5432
ENV DB_DATABASE=keycloak_l3wn
ENV DB_USER=keycloak_l3wn_user
ENV DB_PASSWORD=exBGAs0x5CDliJCt6vbmDZApVkcVLV0m

# Configure proxy
ENV PROXY_ADDRESS_FORWARDING=true

# Expose port
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s CMD /opt/jboss/healthcheck.sh
