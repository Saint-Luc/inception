all: 
	mkdir -p /home/lsanglas/data/mariadb
	mkdir -p /home/lsanglas/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml build
	sudo docker compose -f ./srcs/docker-compose.yml up -d

logs:
	sudo docker logs wordpress
	sudo docker logs mariadb
	sudo docker logs nginx

clean:
	sudo docker container stop nginx mariadb wordpress
	sudo docker rm $(shell sudo docker ps -qa)
	sudo docker network rm inception

fclean: clean
	sudo rm -rf /home/lsanglas/data/mariadb/*
	sudo rm -rf /home/lsanglas/data/wordpress/*
	sudo docker system prune --volumes -af
	sudo docker volume rm $(docker volume ls -q)

re: fclean all

.Phony: all logs clean fclean
