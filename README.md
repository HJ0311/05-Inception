# **Inception**

#### Summary: This document is a System Administration related exercise.

요약: 이 문서는 시스템 관리와 관련된 연습문제이다.

##### Version: 2.1

버전: 2.1

<br>

| Chapter | Contents                                              | page |
| :-----: | :-----------------------------------------------------| :--: |
|    1    | [**Introduction**](#Chapter-1)                        |  3   |
|    2    | [**General guidelines**](#Chapter-2)                  |  4   |
|    3    | [**Mandatory part**](#Chapter-3)                      |  5   |
|    4    | [**Bonus part**](#Chapter-4)                          |  9   |

<br>

# **Chapter 1**

## Introduction

##### This project aims to broaden your knowledge of system administration by using Docker.

이 프로젝트는 도커를 사용하여 시스템 관리 지식을 넓히는 데에 초점을 맞추고 있다.

##### You will virtualize several Docker images, creating them in your new personal virtual machine.

당신은 여러 개의 도커 이미지들을 가상화 하여 새 개인 가상 머신을 만들 것이다.

# **Chapter 2**

## General guidelines

- ##### This project needs to be done on a Virtual Machine.

- 이 프로젝트는 가상 머신을 필요로 한다.

- ##### All the files required for the configuration of your project must be placed in a **srcs** folder.

- 프로젝트 구성에 필요한 모든 파일들을 srcs 폴더 안에 위치해야 한다.

- ##### A **Makefile** is also required and must be located at the root of your directory.

- Makefile은 루트 파일에 위치해야 한다.

	##### It must set up your entire application (i.e., it has to build the Docker images using **docker-compose.yml**.)

	Makefile은 전체 애플리케이션을 설정해야 한다(docker-compose.yml을 사용한 도커 이미지를 빌드해야 한다)

- ##### This subject requires putting into practice comcepts that, depending on your back-ground, you may not have learned yet.

- 이 과제를 해결하면서 배경 지식에 따라, 아직 배우지 않은 개념을 연습하게 될 수도 있다.

	##### Therefore, we advise you not to hesitate to read a lot of documentation related to Docker usage, as well as anything else you will find helpful in order to complete this assignment.

	그러므로, 이번 과제를 완수하는 데 도움이 될 방법을 찾기 위해 도커 사용법에 관한 문서를 망설이지 말고 읽어보기를 추천한다.

# **Chapter 3**

## Mandatory part

##### This project consists in having you set up a small infrastructure composed of different services under specific rules.

이 과제는 특정한 규칙에 따라 다양한 서비스로 구성된 소규모 인프라를 설정하도록 구성되어 있다.

##### The whole project has to be done in a virtual machine. You have to use **docker compose**.

전체 프로젝트는 가상 머신에서 완료되어야 한다. docker compose를 사용해야 한다.

##### Each Docker image must have the same name as its corresponding service.

각 도커 이미지는 반드시 해당 서비스와 이름이 동일해야 한다.

##### Each service has to run in a dedicated container.

각 서비스는 각 전용 컨테이너에서 실행되어야 한다.

##### For performance matters, the containers must be built either from the penultimate stable version of Alpine or Debian. The choice is yours.

성능 문제와 관련하여 컨테이너들은 반드시 알파인 혹은 데비안의 두 번째 안정 버전으로 빌드되어야 한다. 선택은 당신의 몫이다.

##### You also have to write your own **Dockerfiles**, one per service.

또한 각 서비스 당 하나씩 도커 파일을 작성해야 한다.

##### The **Dockerfiles** must be called in your **docker-compose.yml** by your **Makefile**.

도커 파일은 반드시 Makefile에서 docker-compose.yml로 호출되어야 한다.

##### It means you have to build yourself the Docker images of your project.

즉, 스스로 과제의 도커 이미지를 직접 빌드하란 의미이다.

##### It is then for-bidden to pull ready-made Docker images, as well as using services such as DockerHub(Alpine/Debian being excluded from this rule).

도커허브(알파인/데비안은 이 규칙에서 제외됨)같은 서비스를 사용하는 것 뿐만 아니라 이미 만들어진 도커 이미지를 가져오는 것이 금지된다.

##### You then have to set up:

설정해야 될 것:

- ##### A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

- TLSv1.2 혹은 TLSv1.3만 사용하는 NGINX를 포함하고 있는 도커 컨테이너.

- ##### A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.

- nginx가 없는 WordPress + php-fpm(설치 및 구성되어 있어야 함)을 포함하고 있는 도커 컨테이너.

- ##### A Docker container that contains MariaDB only without nginx.

- nginx가 없는 MariaDB를 포함하고 있는 도커 컨테이너.

- ##### A voulme that contains your WordPress database.

- WordPress 데이터 베이스를 포함하고 있는 볼륨

- ##### A second volume that contains your WordPress website files.

- WordPress 웹사이트 파일을 포함하고 있는 두 번째 볼륨

- ##### A **docker-network** that establishes the connection between your containers.

- 컨테이너들간의 연결을 설정하는 도커 네트워크.

##### Your containers have to restart in case of a crash.

당신의 컨테이너는 충돌 시 재시작 되어야 한다.

> ⚠️
>
> ##### A Docker container is not a virtual machine. Thus, it is not recommended to use any hacky patch based on 'tail -f' and so forth when trying to run it. Read about how deamons work and whether it's a good idea to use them or not.
>
> 도커 컨테이너는 가상 머신이 아니다. 그러므로 도커 컨테이너를 실행할 때 'tail -f'를 기반으로 한 해킹 패치 등을 사용하는 것을 추천하지 않는다. 데몬이 어떻게 동작하는지와 사용하는 게 좋을지 아닐지에 대해 문서를 읽어봐라.

> ⚠️
>
> ##### Of course, using network: host or --link or links: is forbidden. The network line must be present in your docker-compose.yml file. Your containers musn't be started with a command running an infinite loop. Thus, this also applies to any command used as entrypoint, or used in entrypoint scripts. The following are a few prohibited hacky patches: tail -f, bash, sleep infinity, while true.
>
> 물론, 네트워크를 사용하는 것: 호스트 또는 --link나 link 들을 사용하는 것은 금지된다. 네트워크 회선은 docker-compose.yml 파일에 적혀있어야 한다. 무한 루프를 실행하는 명령어로 컨테이너를 실행시키지 말아라. 따라서, 엔트리 포인트를 사용하는 모든 명령어 혹은 엔트리 포인트 스크립트에 사용되는 모든 명령어에도 적용된다. 다음은 몇 가지 금지된 해킹 패치들이다: tail -f, bash, sleep infinity, while true.

> ⚠️
>
> ##### Read about PID 1 and the best practices for writing Dockerfiles.
>
> PID 1과 도커파일을 잘 작성하는 방법에 대한 문서를 읽어봐라.

- ##### In your WordPress database, there must be two users, one of them being the ad-ministrator.

- WordPress 데이터베이스에서, 일반 이용자와 관리자, 두 명의 유저가 있어야 한다.

- ##### The administrator's username can't contain admin/Admin or admin-istrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth.)

- 관리자의 유저이름은 admin/Admin 혹은 admin-istrator/Administrator (예시, admin, administrator, Administrator, admin-123 등등)

> ⚠️
>
> ##### Your volumes will be available in the /home/login/data folder of the host machine using Docker. Of course, you have to replace the login with yours.
>
> 볼륨은 도커를 사용하는 호스트 머신의 /home/login/data 폴더에서 사용할 수 있어야 한다. 물론, login은 당신의 닉네임으로 교체될 것이다.

##### To make things simpler, you have to configure your domain name so it points to your local IP address.

더 단순하게 만들기 위해 로컬 IP 주소를 가리키는 도메인명을 구성해라.

##### This domain name must be **login.42.fr**. Again, you have to use your own login.

도메인명은 반드시 login.42.fr이다. login은 당신의 닉네임으로 교체될 것이다.

##### For example, if your login is wil, **wil.42.fr** will redirect to the IP address pointing to wil's website.

예를 들어, wil로 로그인했다면 wil.42.fr가 되며 IP 주소는 wil의 웹 사이트를 가리키도록 재설정된다.

> ⚠️
>
> ##### The latest tag is prohibited. No password must be present in the Dockerfiles. It is mandatory to use environment variables. Also, it is strongly recommended to use a .env file to store environment variables. The .env file should be located at the root of the srcs directory. Your NGINX container must be the only entrypoint into your infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3 protocol.
>
> 최신 태그는 금지된다. 도커 파일에 비밀번호가 없어야 한다. 환경변수를 사용하는 것은 필수이다. 또한, .env 파일을 사용하여 환경 변수를 저장하는 것을 강력히 추천한다. .env 파일은 srcs 디렉터리의 루트에 위치해야 한다. NGINX 컨테이너는 TLSv1.2 또는 TLSv1.3 프로토콜을 사용하여 포트 443을 통해서만 인프라에 접근할 수 있는 유일한 엔트리포인트여야 한다.

##### Here is an example diagram of the expected result:

예상 결과물에 대한 예제 다이어그램이다:

<img width="688" alt="스크린샷 2024-12-06 오후 2 15 55" src="https://github.com/user-attachments/assets/edc89756-704d-48a4-8105-278e8237f08b">

##### Below is an example of the expected directory structure:

아래는 예상 디렉터리 구조의 예제이다:

<img width="725" alt="스크린샷 2024-12-06 오후 2 16 52" src="https://github.com/user-attachments/assets/9a4ae933-e027-4d65-afc3-fc89fa1d6137">

> ⚠️
>
> ##### For obvious security reasons, any credentials, API keys, env variables etc... must be saved locally in a .env file and ignored by git. Publicly stored credentials will lead you directly to a failure of the project.
>
> 명백한 보안상의 이유로, 자격 증명, API 키, 환경 변수 등... 반드시 .env 파일에 로컬로 저장하고 git에서 무시해야 한다. 공개적으로 저장된 자격증명은 프로젝트의 실패로 이어진다.

# **Chapter 4**

## Bonus part

##### For this project, the bonus part is aimed to be simple.

이 프로젝트에서, 보너스 파트는 간단함에 초점을 맞추고 있다.


##### A Dockerfile must be written for each extra service. Thus, each one of them will run inside it's own container and will have, if necessary, its dedicated voulume.

각 추가 서비스에 대한 도커 파일을 작성해야 한다. 따라서, 각 도커 파일은 각자의 자체 컨테이너 안에서 실행되며, 필요한 경우 전용 볼륨이 있다.

##### Bounus list:

- ##### Set up **redis cache** for your WordPress website in order to properly manage the cache.

- 캐시를 제대로 관리하기 위해 WordPress 웹 사이트의 redis cache를 설정한다.

- ##### Set up a **FTP server** container pointing to the volume of your WordPress webstie.

- WordPress 웹 사이트의 볼륨을 가리키는 FTP server 컨테이너를 설정한다.

- ##### Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.

- PHP를 제외한 원하는 언어로 간단한 정적 웹사이트를 만든다(PHP는 제외다!) 예를 들어, 쇼케이스 사이트나 혹은 이력서를 제시하는 사이트 등이 있다.

- ##### Set up **Adminer**.

- 관리자를 설정한다.

- ##### Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.

- 유용하다고 생각되는 서비스를 선택해라. 디펜스 동안, 당신의 선택을 정당화해야 한다.

> ⚠️
>
> ##### To complete the bonus part, you have the possibility to set up extra services. In this case, you may open more ports to suit your needs.
>
> 보너스 파트를 완료하기 위해 추가 서비스들을 설정할 수 있다. 이 경우, 필요에 따라 더 많은 포트를 열 수 있다.

> ⚠️
>
> ##### The bonus part will only be assessed if the mandatory part is PERPECT. Perfect means the mandatory part has been integrally done and works without malfunctioning. If you have not passed ALL the mandatory requirements, your bonus part will not be evaluated at all.
>
> 보너스 파트는 필수 부분이 완벽할 때만 퍙기된다. 완벽하다는 것은 필수 부분이 통합적으로 완수되었으며 오작동 없이 동작한다는 것을 의미한다. 만약 필수 부분을 완벽하게 충족하지 못한 경우 보너스 부분은 전혀 평가되지 않는다.
