DOCKER_COMPOSE = docker compose
SRC_DIR = ./srcs

all: build up

build:
	@echo "Building Docker images..."
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml build

up:
	@echo "Starting containers..."
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml up -d

down:
	@echo "Stopping containers..."
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml down

clean: 
	@echo "Removing Docker images..."
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml down -v
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml rm -f

fclean:
	@echo "Removing all stopped containers, networks, images, and volumes..."
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml down --rmi all --volumes --remove-orphans

re: clean all

.PHONY: all build up down clean re