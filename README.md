# n8n Full Configuration

Configuración completa de n8n con soporte para entornos de producción (HTTPS) y desarrollo local (HTTP).

## 🚀 Inicio Rápido

### Desarrollo Local

```bash
docker-compose -f docker-compose.local.yml up -d
```

Accede a: **http://localhost:5678**

- Usuario: `admin`
- Password: `admin123`

### Producción (con HTTPS)

```bash
docker-compose up -d
```

## 📁 Estructura

```
.
├── docker-compose.yml          # Producción con nginx-proxy y SSL
├── docker-compose.local.yml    # Desarrollo local sin HTTPS
├── Dockerfile                  # Imagen personalizada de n8n
├── nginx/                      # Configuración nginx para producción
│   ├── certs/                  # Certificados SSL
│   ├── html/                   # Archivos estáticos
│   └── vhost.d/                # Configuración de virtual hosts
├── workflows/                  # Workflows de n8n
│   └── chatbot/
├── n8n_data/                   # Datos de n8n (generado)
└── pg_data/                    # Datos de PostgreSQL (generado)
```

## ⚙️ Configuración

### Variables de Entorno - Local

Edita `docker-compose.local.yml`:

```yaml
- N8N_BASIC_AUTH_USER=admin
- N8N_BASIC_AUTH_PASSWORD=admin123
- GENERIC_TIMEZONE=America/Santiago
```

### Variables de Entorno - Producción

Edita `docker-compose.yml`:

```yaml
- N8N_HOST=yourdomain.com
- WEBHOOK_URL=https://yourdomain.com
- N8N_LICENSE_KEY=yourkey
- DB_POSTGRESDB_DATABASE=yourdatabase
```

## 🗄️ Base de Datos

Ambos entornos usan PostgreSQL 15:

- **Local**: `n8n_db` / `n8n_user` / `n8n_password`
- **Producción**: Configurar en variables de entorno

## 📦 Comandos Útiles

```bash
# Ver logs
docker-compose -f docker-compose.local.yml logs -f n8n

# Reiniciar servicios
docker-compose -f docker-compose.local.yml restart

# Detener todo
docker-compose -f docker-compose.local.yml down

# Detener y eliminar volúmenes
docker-compose -f docker-compose.local.yml down -v

# Backup de workflows
docker exec n8n-local n8n export:workflow --all --output=/home/node/.n8n/workflows/
```

## 🔧 Troubleshooting

### n8n no inicia

```bash
# Verificar logs
docker logs n8n-local

# Verificar que PostgreSQL esté saludable
docker ps
```

### Problemas de permisos

```bash
# Ajustar permisos de carpetas
chmod -R 755 n8n_data workflows
```

### Reset completo

```bash
docker-compose -f docker-compose.local.yml down -v
rm -rf n8n_data pg_data
docker-compose -f docker-compose.local.yml up -d
```

## 📚 Features Habilitadas

- ✅ Folders (carpetas para workflows)
- ✅ Workflow History (historial de versiones)
- ✅ Advanced Debugging (debugging avanzado)
- ✅ Execution Tags (etiquetas de ejecución)
- ✅ Runners (ejecución de workflows)

## 🔐 Seguridad

Para producción:

1. Cambia las credenciales por defecto
2. Configura certificados SSL válidos en `nginx/certs/`
3. Actualiza `N8N_HOST` y `WEBHOOK_URL`
4. Usa contraseñas fuertes para PostgreSQL
5. Configura `N8N_LICENSE_KEY` si tienes licencia empresarial

## 📄 Licencia

Este proyecto es una configuración de n8n. Ver [licencia de n8n](https://github.com/n8n-io/n8n/blob/master/LICENSE.md).
