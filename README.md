# Alphasocket/dockerized-apache-alpine
#### apache-alpine
[![](https://travis-ci.org/AlphaSocket/dockerized-apache-alpine.svg?branch=latest-dev )]() [![](https://images.microbadger.com/badges/image/03192859189254/dockerized-apache-alpine:latest-dev.svg)](https://microbadger.com/images/03192859189254/dockerized-apache-alpine:latest-dev ) [![](https://images.microbadger.com/badges/version/03192859189254/dockerized-apache-alpine:latest-dev.svg)](https://microbadger.com/images/03192859189254/dockerized-apache-alpine:latest-dev)

Dockerized apache service *installed* on alpine distro

## Branches & Versions
- latest
- latest-dev


## Packages installed
- Setup dependencies:
  + apache2
  + apache2-utils


## Configurable envvars
~~~
CONFIG_APACHE_SERVERNAME="apache-alpine"
CONFIG_APACHE_ALIAS="apache-alpine"
CONFIG_APACHE_TIMEOUT="1000"
CONFIG_APACHE_DOCUMENT_ROOT="/var/www/html"
CONFIG_APACHE_DOCUMENT_INDEX="index.php"
CONFIG_APACHE_DOCUMENT_OPTIONS="FollowSymLinks"
CONFIG_PHP_PROXY_TIMEOUT="100"
CONFIG_PHP_PROXY_REGEX=".+\.ph(p[3457]?|t|tml)$"
CONFIG_PHP_FPM_HOST="php-fpm.service"
CONFIG_PHP_FPM_PORT="9000"
CONFIG_PATHS_TEMPLATES_APACHE_SERVER="/usr/local/templates/10-server.conf"
CONFIG_PATHS_TEMPLATES_APACHE_SSL="/usr/local/templates/10-ssl.conf"
CONFIG_PATHS_TEMPLATES_APACHE_FASTCGI="/usr/local/templates/20-fastcgi.conf"
CONFIG_PATHS_TEMPLATES_APACHE_VHOST_DEV="/usr/local/templates/dev_vhost.conf"
CONFIG_PATHS_TEMPLATES_APACHE_VHOST_PRD="/usr/local/templates/prd_vhost.conf"
CONFIG_PATHS_CONF_APACHE_SERVER="/etc/apache2//conf.d/10-server.conf"
CONFIG_PATHS_CONF_APACHE_SSL="/etc/apache2//conf.d/10-ssl.conf"
CONFIG_PATHS_CONF_APACHE_FASTCGI="/etc/apache2//conf.d/20-fastcgi.conf"
CONFIG_PATHS_CONF_APACHE_VHOST="/etc/apache2//vhost.d/main.conf"
~~~


