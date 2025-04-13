FROM debian:bullseye
EXPOSE 3306
RUN apt update
RUN apt install mariadb-server mariadb-client -y
COPY init.sh /usr/local/bin/init_db.sh
RUN chmod +x /usr/local/bin/init_db.sh
CMD ["bash", "/usr/local/bin/init.sh"]
