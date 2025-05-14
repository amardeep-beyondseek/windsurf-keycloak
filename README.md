# Windsurf Keycloak

This repository contains the Keycloak configuration for the Windsurf project.

## Deployment on Render.com

1. Create a new Web Service on Render.com
2. Connect this repository
3. Set the following environment variables:
   - `KEYCLOAK_ADMIN`: Admin username
   - `KEYCLOAK_ADMIN_PASSWORD`: Admin password
   - `KC_DB_URL`: PostgreSQL database URL
   - `KC_DB_USERNAME`: Database username
   - `KC_DB_PASSWORD`: Database password
   - `KC_HOSTNAME`: Your Keycloak domain (e.g., windsurf-keycloak.onrender.com)

## Post-Deployment Setup

1. Access the Keycloak admin console at `https://<your-keycloak-domain>/admin`
2. Log in with the admin credentials
3. Create a new realm called `windsurf`
4. Create a new client:
   - Client ID: `react-auth`
   - Client Protocol: `openid-connect`
   - Access Type: `public`
   - Valid Redirect URIs: 
     - `http://localhost:5000/*`
     - `https://windsurf-main.onrender.com/*`
   - Web Origins: 
     - `+` (or specify your domains)
