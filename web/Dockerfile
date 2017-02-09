FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C && \
    apt-get update && \
    apt-get -yq upgrade

RUN apt-get -y --force-yes --no-install-recommends install \     
        libapache2-mod-php7.0 \
        apache2 \
        php7.0-fpm php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-intl \ 
        php7.0-json php7.0-mbstring php7.0-memcached php7.0-memcache php7.0-mcrypt \ 
        php7.0-mysql php7.0-opcache php7.0-pgsql php7.0-soap php7.0-sqlite3 \
        php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip php7.0-imagick \
        curl \
        nano && \
        a2enmod rewrite && \
        a2enmod expires && \
        rm -rf /var/lib/apt/lists/*

COPY apache2 /etc/apache2
COPY php.ini /etc/php/7.0/apache2/

COPY apache2 /etc/apache2
COPY php.ini /etc/php/7.0/apache2/
COPY php.ini /etc/php/7.0/cli/

COPY apache2-foreground.sh /
RUN chmod 755 /apache2-foreground.sh

VOLUME /var/www

ENTRYPOINT ["/apache2-foreground.sh"]