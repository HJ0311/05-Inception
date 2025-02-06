DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
DB_VOL_DIR := /home/hyehan/data/MariaDB
WP_VOL_DIR := /home/hyehan/data/WP
PJ_NETWORK := srcs_inception_network
COMPOSE_CMD := docker compose -f ${DOCKER_COMPOSE_FILE}

up:
	@mkdir -p ${DB_VOL_DIR} && chmod 755 ${DB_VOL_DIR}
	@mkdir -p ${WP_VOL_DIR} && chmod 755 ${WP_VOL_DIR}
	@${COMPOSE_CMD} up -d

down:
	@${COMPOSE_CMD} down --volumes --rmi all --remove-orphans
	@rm -rf ${DB_VOL_DIR}
	@rm -rf ${WP_VOL_DIR}

re:
	@rm -rf ${DB_VOL_DIR}
	@rm -rf ${WP_VOL_DIR}
	@${COMPOSE_CMD} up --build

ps:
	@docker container ps -a

.PHONY: all re down ps