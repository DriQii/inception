FROM ubuntu:22.04
EXPOSE 9000
WORKDIR /website
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install curl php-fpm php-mysql -y
RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz
RUN mv wordpress/* /website
RUN	rm -r wordpress
CMD ["/usr/sbin/php-fpm8.1", "-F"]
