FROM postgres:16

LABEL maintainer="vps-postgresql"
LABEL description="PostgreSQL 16 personalizado para VPS"

ENV POSTGRES_DB=vps_postgresql
ENV POSTGRES_USER=db_user
ENV POSTGRES_PASSWORD=secure_password_123

COPY init-scripts /docker-entrypoint-initdb.d/

EXPOSE 5432

VOLUME /var/lib/postgresql/data
