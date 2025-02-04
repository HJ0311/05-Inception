DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
DB_VOL_DIR := /home/hyehan/data/MariaDB
WP_VOL_DIR := /home/hyehan/data/WP
PJ_NETWORK := srcs_inception_network
COMPOSE_CMD := docker compose -f ${DOCKER_COMPOSE_FILE}

up:
	@mkdir -p ${DB_VOL_DIR} && chmod 755 ${DB_VOL_DIR}
	@mkdir -p ${WP_VOL_DIR} && chmod 755 ${WP_VOL_DIR}
	@${COMPOSE_CMD} up

down:
	@${COMPOSE_CMD} down

re:
	@rm -rf ${DB_VOL_DIR}
	@rm -rf ${WP_VOL_DIR}
	@${COMPOSE_CMD} up --build

clean:
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm ${PJ_NETWORK};

	@rm -rf ${DB_VOL_DIR}
	@rm -rf ${WP_VOL_DIR}

ps:
	@docker container ps -a

.PHONY: all re down clean ps