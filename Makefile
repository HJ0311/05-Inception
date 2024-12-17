DOCKER_COMPOSE := docker-compose
DOCKER_COMPOSE_FILE := src/docker-compose.yml

# COMMAND
.PHONY: up down build start stop restart logs

up: # docker compose 서비스 시작 (-f: compose 파일 지정 | -d: 서비스를 백그라운드에서 실행)
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down: # docker compose 서비스 중지 및 컨테이너 정리
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

build:	#docker compose 이미지를 빌드
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

start: # 이미 실행 중지된 컨테이너를 시작
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) start

stop: # 실행 중인 컨테이너를 중지
	$(DOCKER_COMPOSE) -f #(DOCKER_COMPOSE_FILE) stop

restart: # 컨테이너 재시작
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) restart

logs: # 실행 중인 컨테이너의 로그 출력
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f