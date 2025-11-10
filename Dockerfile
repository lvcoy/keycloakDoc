FROM quay.io/keycloak/keycloak:26.0.0

# Copiamos el realm exportado
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Usuario admin por defecto
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Base de datos en archivo (sin Postgres)
ENV KC_DB=dev-file

# Import automático del realm
ENV KC_IMPORT=/opt/keycloak/data/import/realm-export.json

# Configuración recomendada para Render
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME=keycloakdoc.onrender.com
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge
ENV KC_PROXY_HEADERS=xforwarded
ENV KC_LOG_LEVEL=INFO

EXPOSE 8080

# Iniciamos Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080"]
