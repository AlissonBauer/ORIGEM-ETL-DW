FROM mysql:8.0.16

ENV MYSQL_ROOT_PASSWORD 1234
COPY ./dw-clinica.sql /docker-entrypoint-initdb.d/02-dw-clinica.sql

