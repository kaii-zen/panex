FROM biarms/mysql:5.7
LABEL authors="kaiizen"

COPY schema.sql /docker-entrypoint-initdb.d/0-schema.sql
COPY data.sql /docker-entrypoint-initdb.d/1-data.sql

HEALTHCHECK CMD mysqladmin ping -uroot
