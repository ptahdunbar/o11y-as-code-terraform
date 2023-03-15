#!make
.PHONY: setup_env

setup_env: setup_env0 setup_env1 setup_env2 setup_env4

setup_env0:
	[ ! -f apps/cloud-infra/.env ] && cp apps/cloud-infra/.env.example apps/cloud-infra/.env

setup_env1:
	[ ! -f apps/web-api/.env ] && cp apps/web-api/.env.example apps/web-api/.env

setup_env2:
	[ ! -f apps/login-service/.env ] && cp apps/login-service/.env.example apps/login-service/.env

# setup_env3:
# 	[ ! -f o11y/.env ] && cp o11y/.env.example o11y/.env

setup_env4:
	[ ! -f o11y/terraform.tfvars ] && cp o11y/terraform.tfvars.example o11y/terraform.tfvars

source:
	. o11y/.env

up:
	docker compose up --build -d

logs:
	docker compose logs -f

down:
	docker compose down