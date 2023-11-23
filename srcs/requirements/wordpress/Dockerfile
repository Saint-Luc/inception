FROM debian:bullseye-slim

RUN apt update -y && apt upgrade -y \
    && apt install -y wget php7.4 php7.4-fpm php7.4-mysql default-mysql-client mariadb-client \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && chmod +x /usr/local/bin/wp \
    && wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html \
    && tar -xzf /var/www/html/wordpress-6.1.1.tar.gz -C /var/www/html \
    && rm /var/www/html/wordpress-6.1.1.tar.gz \
    && chown -R www-data:www-data /var/www/* \
    && chmod -R 755 /var/www/*

COPY ./tools/wordpress.sh ./
COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x ./wordpress.sh

ENTRYPOINT ["bash", "./wordpress.sh"]
EXPOSE 9000

