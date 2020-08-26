FROM mariadb:10.3

ENV MYSQL_RANDOM_ROOT_PASSWORD=yes

COPY initdb.d/* /docker-entrypoint-initdb.d/
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/
