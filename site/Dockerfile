FROM debian:11
EXPOSE 9000
WORKDIR /website
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl php7.4-fpm php-mysql -y
RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz
RUN mv wordpress/* /website
RUN	rm -r wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/
CMD ["bash", "/usr/local/bin/init.sh"]
