FROM php:7.0-apache
COPY deploy/bula-fiji-node/src/ /var/www/html
EXPOSE 80
VOLUME /var/www/html

