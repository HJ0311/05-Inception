DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
DB_VOL_DIR := /home/hyehan/data/MariaDB
WP_VOL_DIR := /home/hyehan/data/WP

COMPOSE_CMD := docker-compose -f ${DOCKER_COMPOSE_FILE}

.PHONY : up down clean build start stop restart logs ps

# docker compose 서비스 시작 (-f: compose 파일 지정 | -d: 서비스를 백그라운드에서 실행)
up:
	@mkdir -p ${DB_VOL_DIR} || true
	@mkdir -p ${WP_VOL_DIR} || true
	${COMPOSE_CMD} up -d

# docker compose 서비스 중지 및 컨테이너 정리
down:
	${COMPOSE_CMD} down

# 볼륨 폴더 제거
clean:
	@rm -rf ${DB_VOL_DIR}/
	@rm -rf ${WP_VOL_DIR}/
	docker-compose down --rmi all; clear

# docker compose 이미지를 빌드
build:
	${COMPOSE_CMD} build

# 이미 실행 중지된 컨테이너를 시작
start:
	${COMPOSE_CMD} start

# 실행 중인 컨테이너를 중지
stop:
	${COMPOSE_CMD} stop

# 컨테이너 재시작
restart:
	${COMPOSE_CMD} restart

# 로그 확인
logs:
	${COMPOSE_CMD} logs -f

# 컨테이너 상태 확인
ps:
	${COMPOSE_CMD} ps