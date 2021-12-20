up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
init:
	@make build
	@make up
rebuild:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
py:
	docker-compose exec py bash
ml:
	docker-compose exec py mlflow server --host 0.0.0.0
server-list:
	docker-compose exec py bash -c 'jupyter server list'
