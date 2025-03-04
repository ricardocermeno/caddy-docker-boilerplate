-include .env.local
export 

login.registry dlogin:
	docker login registry.gitlab.com -u ${GITLAB_USERNAME} -p ${GITLAB_TOKEN}


build:
	@docker-compose build

up: service ?=
up:
	@docker-compose up $(service) -d --pull always --force-recreate --remove-orphans 

ps:
	@docker-compose ps
stop:
	@docker-compose stop
down:
	@docker-compose down

pull:
	@docker-compose pull

log: service ?=
log:
	@docker-compose logs $(service) -f

tail t:
	tail -f .caddy/logs/caddy/access.log