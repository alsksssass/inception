all:
	if [ ! -d "/home/sabyun/data" ]; then \
		mkdir -p /home/sabyun/data/wordpress; \
		mkdir -p /home/sabyun/data/mariadb; \
		mkdir -p /home/sabyun/data/code_server; \
	fi	
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	doas rm -rf /home/sabyun/data

