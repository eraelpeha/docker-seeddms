FROM php:8.6.0-fpm-trixie

# Update and install necessary packages
RUN apt-get update \
    && apt-get install libpq-dev libmagickwand-dev imagemagick id3 poppler-utils catdoc xpdf html2text docx2txt zlib1g-dev libpng-dev libzip-dev libxslt-dev -y \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install gd mysqli pdo pdo_mysql pdo_pgsql zip xsl intl \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && pear channel-update pear.php.net \
    && pear install Log \
    && pear install Mail \
    && pear install Net_SMTP \
    && pear install HTTP_WebDAV_Server-1.0.0RC8 \
## Slim down apt
    && rm -rf /var/lib/apt/lists/*

# Copy settings-files
COPY sources/php.ini $PHP_INI_DIR/



