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

## GitHub Container Registry (GHCR)

### Imagen del Contenedor

La imagen está disponible en:
```
ghcr.io/tu-usuario/vps-postgresql:latest
```

### Pull de la Imagen

```bash
docker pull ghcr.io/tu-usuario/vps-postgresql:latest
```

### Ejecutar desde GHCR

```bash
docker run -d \
  --name vps-postgresql \
  -p 5432:5432 \
  -e POSTGRES_DB=vps_postgresql \
  -e POSTGRES_USER=db_user \
  -e POSTGRES_PASSWORD=tu_password_seguro \
  -v postgres_data:/var/lib/postgresql/data \
  ghcr.io/tu-usuario/vps-postgresql:latest
```

## CI/CD

El workflow de GitHub Actions (`docker-publish.yml`) construye y sube automáticamente la imagen al GHCR cuando se hace push a la rama `main`.

### Requisitos

1. Habilitar GitHub Packages en el repositorio
2. El token `GITHUB_TOKEN` se proporciona automáticamente

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
