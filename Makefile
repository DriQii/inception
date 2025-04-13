all :
	mkdir -p ~/data/db_vol
	mkdir -p ~/data/web_vol
	docker compose -f ./srcs/docker-compose.yml up --build -d
clean :
	docker compose  -f ./srcs/docker-compose.yml down -v

