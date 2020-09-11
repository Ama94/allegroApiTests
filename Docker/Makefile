all: help

help:
	@echo "\t  1. make install          - First instalation"
	@echo "\t  2. make build            - Build(update) containers"
	@echo "\t  3. make build-pull       - Stops, Downloads and builds dockers containers"
	@echo "\t  4. make run              - Runs docker"
	@echo "\t  5. make kill             - Kills containers"
	@echo "\t  6. make run-bg           - Runs docker in background"
	@echo "\t  7. make sh-java8         - Access to container java8"

install: build-pull run-bg

build:
	@docker-compose build

build-pull:
	@docker-compose stop
	@docker-compose rm -f
	@docker-compose pull && docker-compose build

start-machine:
	@docker-machine start default

run:
	@docker-compose up --force-recreate

run-bg:
	@docker-compose up -d

kill:
	@docker-compose kill

sh-java8:
	@docker exec -it `docker-compose ps |grep -Eo '^[^ ]+' |grep java8` sh


