FROM postgres:16

LABEL maintainer="vps-postgresql"
LABEL description="PostgreSQL 16 personalizado para VPS"

EXPOSE 5432

VOLUME /var/lib/postgresql/data
