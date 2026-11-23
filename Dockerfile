FROM php:8.6.0-fpm-trixie

COPY --from=ghcr.io/php/pie:bin /pie /usr/local/bin/pie

# Update and install necessary packages
RUN apt-get update \
    && apt-get install -y \
        libtool \
        libonig-dev \
        libpq-dev \
        libmagickwand-dev \
#        imagemagick \
        id3 \
        poppler-utils \
        catdoc \
        xpdf \
        html2text \
        docx2txt \
        zlib1g-dev \
        libpng-dev \
        libzip-dev \
        libxslt-dev \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install -j$(nproc) gd mbstring mysqli pdo pdo_mysql pdo_pgsql zip xsl intl \
#    && pie install imagick/imagick:@dev \
    && curl -fsSL https://pear.php.net/go-pear.phar -o /tmp/go-pear.phar \
    && echo "" | php /tmp/go-pear.phar \
    && rm -f /tmp/go-pear.phar \
    && pear channel-update pear.php.net \
    && pear install Log \
    && pear install Mail \
    && pear install Net_SMTP \
    && pear install HTTP_WebDAV_Server-1.0.0RC8 \
    && rm -rf /var/lib/apt/lists/*

# Copy settings-files
COPY sources/php.ini $PHP_INI_DIR/
