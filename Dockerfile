# Usa la imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Copia el realm exportado
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Variables básicas
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_DB=dev-file

# Configura correctamente el hostname público
ENV KC_HOSTNAME=keycloakdoc.onrender.com
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_PROXY=edge

# Importa el realm automáticamente
ENV KC_IMPORT=/opt/keycloak/data/import/realm-export.json

# Expone el puerto correcto
EXPOSE 8080

# Inicia en modo desarrollo
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080", "--hostname", "keycloakdoc.onrender.com"]
