FROM php:8.1-fpm

RUN docker-php-ext-install bcmath bz2 curl gd intl ldap mbstring mysqli opcache pgsql soap xml zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY conf.d/* $PHP_INI_DIR/conf.d/