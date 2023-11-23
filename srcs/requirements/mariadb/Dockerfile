FROM debian:bullseye-slim

RUN apt update && apt -y upgrade \
    && apt -y install mariadb-server mariadb-client procps \
    && mkdir -p /var/run/mysqld /var/lib/mysql \
    && chown mysql:mysql /var/run/mysqld /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mysql.sh /
RUN chmod u+x /mysql.sh

ENTRYPOINT ["bash", "./mysql.sh"]
EXPOSE 3306

