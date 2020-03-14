FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=root MYSQL_USER=mysqluser MYSQL_PASSWORD=abc123

COPY init_db.sql /docker-entrypoint-initdb.d/

CMD ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_general_ci"]