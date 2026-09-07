# vps-postgresql

PostgreSQL 16 personalizado para VPS con Docker y GitHub Container Registry.

## Inicio Rápido

### Desarrollo Local

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/vps-postgresql.git
cd vps-postgresql
```

2. Iniciar el contenedor:
```bash
docker-compose up -d
```

3. Verificar que está ejecutándose:
```bash
docker-compose ps
```

### Variables de Entorno

Editar el archivo `.env` para personalizar:

```env
POSTGRES_DB=vps_postgresql
POSTGRES_USER=db_user
POSTGRES_PASSWORD=secure_password_123
POSTGRES_PORT=5432
```

### Conexión

```bash
# Conectar desde línea de comandos
psql -h localhost -p 5432 -U db_user -d vps_postgresql

# O usar Docker exec
docker exec -it vps-postgresql psql -U db_user -d vps_postgresql
```

## CI/CD

### GitHub Container Registry (GHCR)

La imagen está disponible en:
```
ghcr.io/ebugedo/vps-postgresql:latest
```

### Workflows de GitHub Actions

| Workflow | Archivo | Trigger | Función |
|----------|---------|---------|---------|
| Build and Push to GHCR | `docker-build.yml` | Push a `main` / PR | Construir y subir imagen a GHCR |
| Deploy to VPS | `deploy-vps.yml` | Después de build exitoso / manual | Desplegar imagen en VPS |

#### Workflow 1: Build and Push to GHCR (`docker-build.yml`)

Se ejecuta automáticamente cuando se hace push a la rama `main` o se crea una PR.

- Construye la imagen Docker
- Sube la imagen a GitHub Container Registry
- Genera tags automáticos (latest, SHA, branch)

#### Workflow 2: Deploy to VPS (`deploy-vps.yml`)

Se ejecuta automáticamente después de un build exitoso o manualmente.

- Conecta al VPS por SSH
- Pull de la最新 imagen desde GHCR
- Detiene y elimina el contenedor anterior
- Ejecuta el nuevo contenedor
- Verifica el health check

### Secretos Requeridos en GitHub

Configurar estos secretos en el repositorio de GitHub:

| Secreto | Descripción | Ejemplo |
|---------|-------------|---------|
| `VPS_HOST` | IP o hostname del VPS | `192.168.1.100` |
| `VPS_USERNAME` | Usuario SSH del VPS | `deploy` |
| `VPS_SSH_KEY` | Clave privada SSH | `-----BEGIN OPENSSH...` |
| `VPS_PORT` | Puerto SSH (default: 22) | `22` |

### Configuración de PostgreSQL en VPS

Las credenciales de PostgreSQL se almacenan en `/opt/app_secrets/secrets.json` en el VPS:

```json
{
  "postgresql": {
    "POSTGRES_DB": "postgresql-db-ia-tests",
    "POSTGRES_USER": "timeforsoftware@gmail.com",
    "POSTGRES_PASSWORD": "timeforsoftware",
    "POSTGRES_PORT": 5432,
    "TZ": "Europe/Madrid"
  }
}
```

**Nota:** El archivo `secrets.json` se monta como solo lectura en el contenedor.

### Requisitos

1. Habilitar GitHub Packages en el repositorio
2. El token `GITHUB_TOKEN` se proporciona automáticamente
3. Configurar los secretos de VPS en GitHub
4. Crear `/opt/app_secrets/secrets.json` en el VPS con la configuración de PostgreSQL

## Comandos Útiles

```bash
# Iniciar
docker-compose up -d

# Detener
docker-compose down

# Ver logs
docker-compose logs -f postgres

# Reconstruir
docker-compose build --no-cache

# Acceder al contenedor
docker exec -it vps-postgresql bash
```

## Backup y Restore

```bash
# Backup
docker exec vps-postgresql pg_dumpall -U db_user > backup.sql

# Restore
cat backup.sql | docker exec -i vps-postgresql psql -U db_user
```

## Licencia

MIT
