FROM jboss/keycloak:16.1.1

# Set admin credentials
ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=admin123

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
EXPOSE 8080 8443

# Use custom port for Render
CMD ["-b", "0.0.0.0"]
