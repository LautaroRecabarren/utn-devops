# Custom base image in a private registry from https://github.com/Fichen/utn-devops/blob/unidad-5-integrador/docker/registry/Dockerfile.base
# domain name resolution has been set hosts file in https://github.com/Fichen/utn-devops/blob/unidad-5-integrador/hostConfigs/etc_hosts.txt
FROM docker-registry.int:5000/myapp-example

COPY ./docker-configs/php/php.ini $PHP_INI_DIR/custom.ini
COPY ./docker-configs/httpd/app.site.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

COPY . /var/www/html

EXPOSE 8081


