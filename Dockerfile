# Imagen base oficial de Keycloak
FROM quay.io/keycloak/keycloak:26.0.0

# Copiamos el realm exportado
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

# Configuración de arranque
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm", "--http-port=8080", "--hostname-strict=false"]
