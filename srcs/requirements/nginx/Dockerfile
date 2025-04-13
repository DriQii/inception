FROM debian:11
EXPOSE 443
WORKDIR /serv
RUN apt update
RUN apt install nginx -y
CMD ["nginx", "-g", "daemon off;"]
