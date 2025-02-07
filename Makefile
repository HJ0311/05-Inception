DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
DB_VOL_DIR := /home/hyehan/data/mysql
WP_VOL_DIR := /home/hyehan/data/wordpress

COMPOSE_CMD := docker compose -f ${DOCKER_COMPOSE_FILE}

up:
	@mkdir -p ${DB_VOL_DIR} && chmod 755 ${DB_VOL_DIR}
	@mkdir -p ${WP_VOL_DIR} && chmod 755 ${WP_VOL_DIR}
	@${COMPOSE_CMD} up -d --build

down:
	@${COMPOSE_CMD} down --rmi all -v
	@rm -rf ${DB_VOL_DIR}
	@rm -rf ${WP_VOL_DIR}

re: down up

ps:
	@docker container ps -a

.PHONY: all re down ps