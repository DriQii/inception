all :
	ls -a ~/data
	mkdir -p ~/data/db_vol
	mkdir -p ~/data/web_vol
	docker compose up --build -d
clean :
	docker compose down -v

fclean : clean
	docker image rm db_img serv_img site_img

fvclean : clean
	docker image rm db_img serv_img site_img
	rm -rf ~/data/db_vol
	rm -rf ~/data/web_vol

re : fclean all

rev : fvclean all
