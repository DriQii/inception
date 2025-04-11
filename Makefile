all :
	mkdir -p ~/data/db_vol
	mkdir -p ~/data/web_vol
	docker build -t serv_img ./serv
	docker build -t db_img ./db
	docker build -t site_img ./site
	docker compose up -d
clean :
	docker compose down

fclean : clean
	docker image rm db_img serv_img site_img

fvclean : clean
	docker volume rm inception_db_vol
	docker volume rm inception_web_vol
	rm -rf ~/data/db_vol
	rm -rf ~/data/web_vol
	docker image rm db_img serv_img site_img

re : fclean all

rev : fvclean all
