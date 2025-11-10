# Usa la imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Copia tu realm exportado
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Variables de entorno básicas
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Base de datos embebida (H2)
ENV KC_DB=dev-file

# Importa el realm automáticamente
ENV KC_IMPORT=/opt/keycloak/data/import/realm-export.json

# Expone el puerto para Render
EXPOSE 8080

# Inicia Keycloak en modo desarrollo (sin https estricto)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080", "--hostname-strict=false", "--proxy=edge"]
