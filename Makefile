# ==========
# tasks
default: all

all: up

reup: down up


# ==========
# interaction tasks
sh:
	docker compose exec n8n /bin/sh

cert:
	sh bin/cert.sh

# ==========
# docker compose aliases
up:
	docker compose up -d

active:
	docker compose up

ps images down build:
	docker compose $@

im: images

build-no-cache:
	docker compose build --no-cache

clean: clean-containers

clean-containers:
	docker compose down --rmi all

clean-cert:
	rm -rf .certs

