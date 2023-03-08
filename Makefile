#!make
.PHONY: setup_env

setup_env: setup_env1 setup_env2 setup_env3

setup_env1:
	[ ! -f apps/web-api/.env ] && cp apps/web-api/.env.example apps/web-api/.env

setup_env2:
	[ ! -f apps/login-service/.env ] && cp apps/login-service/.env.example apps/login-service/.env

setup_env3:
	[ ! -f o11y/.env ] && cp o11y/.env.example o11y/.env

source:
	. o11y/.env

up:
	docker compose up -d

logs:
	docker compose logs -f

down:
	docker compose down