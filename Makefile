.PHONY: all dev prepare start

NAME := tmp

all : build start

build:
	@docker build -t $(NAME) -f Dockerfile .

start: build
	@docker run --rm -it \
		-v $(shell pwd)/data/:/var/www/html/ \
		-v /etc/localtime:/etc/localtime:ro \
		-p 80:80 \
		$(NAME)
