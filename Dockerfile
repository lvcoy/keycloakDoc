# Usa la imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Copia tu realm exportado
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Variables de entorno
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Base de datos embebida (H2)
ENV KC_DB=dev-file

# Importa el realm automáticamente
ENV KC_IMPORT=/opt/keycloak/data/import/realm-export.json

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", \
  "--http-port=8080", \
  "--hostname=keycloakdoc.onrender.com", \
  "--hostname-strict=false", \
  "--spi-hostname-default-frontend-url=https://keycloakdoc.onrender.com"]
