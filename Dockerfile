FROM docker.n8n.io/n8nio/n8n:1.121.2

ENV GENERIC_TIMEZONE=America/Santiago \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=admin123 \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Si tienes archivos personalizados, usa el path correcto
# COPY ./mi-archivo.js /home/node/.n8n/

# No cambies el WORKDIR ni sobrescribas CMD
