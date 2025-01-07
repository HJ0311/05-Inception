#####################
# Install essential #
#####################

sudo apt-get update
sudo apt-get install vim
sudo apt-get install make
sudo apt-get install curl


##################
# Install Docker #
##################

# ca-certificates: SSL 인증서를 관리해 HTTPS 요청의 신뢰성 보장, curl: URL 요청을 위한 명령줄 도구
# gnugp: GPG 키를 관리해 패키지 서명을 확인, lsb-release: 배포판 정보를 제공하는 유틸리티
sudo apt-get install ca-certificates curl gnupg lsb-release
# GPG 키를 저장할 디렉토리 설정
sudo mkdir -p /etc/apt/keyrings
# 도커 저장소의 GPG 키를 다운로드(도커 패키지의 신뢰성 검증)
# gpg --dearmor: 다운로드한 GPG키를 바이너리 형식으로 변환해 저장
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# $(dpkg --print-architecture)는 시스템의 CPU 아키텍처를 반환한다(ex: amd64, arm64, ...)
# $(lsb_release -cs)는 현재 배포판의 코드네임(ex: bullseye)을 반환한다
# signed-by=/etc/apt/keyrings/docker.gpg: GPG키를 사용해 저장소에서 제공하는 패키지의 신뢰성을 확인한다.
# sudo tee: 생성된 저장소 URL을 파일에 추가
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu focal stable" \
	| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# 도커 설치
sudo apt-get install docker.io
sudo apt-get install docker-compose-plugin

##########################
# Install Docker Compose #
##########################

sudo curl -L https://github.com/docker/compose/releases/download/v2.32.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version