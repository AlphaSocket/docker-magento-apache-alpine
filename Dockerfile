#
# Do not change content here, image automatically built
#
FROM alpine:latest

ARG BUILD_COMMIT
ARG BUILD_TIME

ENV \
	 BUILD_COMMIT=$BUILD_COMMIT \
	 BUILD_DATE=$BUILD_DATE \
	GENERAL_DOCKER_USER="03192859189254" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_NAME="apache-alpine" \
	BUILD_BRANCH="latest-dev" \
	BUILD_COMMIT="660561a" \
	BUILD_VERSION="latest" \
	BUILD_ENV="dev" \
	BUILD_APACHE_PORT_DEV="80" \
	BUILD_APACHE_PORT_PRD="443" \
	BUILD_DOCKERFILE_IMAGE="alpine:latest" \
	BUILD_DOCKERFILE_PORTS_MAIN="80" \
	BUILD_DOCKERFILE_CMD="/usr/sbin/apache2 -D FOREGROUND -f /etc/apache2/apache.conf" \
	SETUP_DEPENDENCIES_SETUP="apache2 apache2-utils" \
	SETUP_DEPENDENCIES_CONFIG="" \
	SETUP_APACHE_CONF_PATH="/etc/apache2/" \
	SETUP_APACHE_CONF_MAIN="/etc/apache2//apache.conf" \
	SETUP_APACHE_CONF_CONFD="/etc/apache2//conf.d" \
	SETUP_APACHE_CONF_VHOSTD="/etc/apache2//vhost.d" \
	SETUP_PHP_FPM="True" \
	CONFIG_APACHE_SERVERNAME="apache-alpine" \
	CONFIG_APACHE_ALIAS="apache-alpine" \
	CONFIG_APACHE_TIMEOUT="1000" \
	CONFIG_APACHE_DOCUMENT_ROOT="/var/www/html" \
	CONFIG_APACHE_DOCUMENT_INDEX="index.php" \
	CONFIG_APACHE_DOCUMENT_OPTIONS="FollowSymLinks" \
	CONFIG_PHP_PROXY_TIMEOUT="100" \
	CONFIG_PHP_PROXY_REGEX=".+\.ph(p[3457]?|t|tml)$" \
	CONFIG_PHP_FPM_HOST="php-fpm.service" \
	CONFIG_PHP_FPM_PORT="9000" \
	CONFIG_PATHS_TEMPLATES_APACHE_SERVER="/usr/local/templates/10-server.conf" \
	CONFIG_PATHS_TEMPLATES_APACHE_SSL="/usr/local/templates/10-ssl.conf" \
	CONFIG_PATHS_TEMPLATES_APACHE_FASTCGI="/usr/local/templates/20-fastcgi.conf" \
	CONFIG_PATHS_TEMPLATES_APACHE_VHOST_DEV="/usr/local/templates/dev_vhost.conf" \
	CONFIG_PATHS_TEMPLATES_APACHE_VHOST_PRD="/usr/local/templates/prd_vhost.conf" \
	CONFIG_PATHS_CONF_APACHE_SERVER="/etc/apache2//conf.d/10-server.conf" \
	CONFIG_PATHS_CONF_APACHE_SSL="/etc/apache2//conf.d/10-ssl.conf" \
	CONFIG_PATHS_CONF_APACHE_FASTCGI="/etc/apache2//conf.d/20-fastcgi.conf" \
	CONFIG_PATHS_CONF_APACHE_VHOST="/etc/apache2//vhost.d/main.conf"

ADD envvars /usr/local/envvars
ADD bin/setup /usr/local/bin/setup
ADD bin/config /usr/local/bin/config
ADD templates /usr/local/templates

RUN chmod +rx /usr/local/bin/setup && \
    chmod +rx /usr/local/bin/config && \
    sync && \
    /usr/local/bin/setup 

EXPOSE 80 

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/config && /usr/sbin/apache2 -D FOREGROUND -f /etc/apache2/apache.conf"]

LABEL \
    org.label-schema.vcs-ref=660561a \
    org.label-schema.vcs-url="https://github.com/AlphaSocket/dockerized-apache-alpine"