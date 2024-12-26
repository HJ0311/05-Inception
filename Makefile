DOCKER_COMPOSE_FILE := srcs/docker-compose.yml

.PHONY : up down build start stop restart logs

# docker compose 서비스 시작 (-f: compose 파일 지정 | -d: 서비스를 백그라운드에서 실행)
up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

# docker compose 서비스 중지 및 컨테이너 정리
down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

# docker compose 이미지를 빌드
build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build -d

# 이미 실행 중지된 컨테이너를 시작
start:
	docker-compose -f $(DOCKER_COMPOSE_FILE) start

# 실행 중인 컨테이너를 중지
stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

# 컨테이너 재시작
restart:
	docker-compose -f $(DOCKER_COMPOSE_FILE) restart

# 실행 중인 컨테이너의 로그 출력
logs:
	docker compose -f $(DOCKER_COMPOSE_FILE) logs -f