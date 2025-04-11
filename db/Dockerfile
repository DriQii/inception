FROM ubuntu:22.04
EXPOSE 3306
RUN apt update
RUN apt install mariadb-server mariadb-client -y
CMD ["bash", "/usr/local/bin/init_db.sh"]
