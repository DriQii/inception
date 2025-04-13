all :
	mkdir -p ~/data/db_vol
	mkdir -p ~/data/web_vol
	docker compose up --build -d
clean :
	docker compose down -v

