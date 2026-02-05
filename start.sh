#!/bin/bash

docker build -t nauakavlis/laravel-factory:latest . && \
docker push nauakavlis/laravel-factory:latest && \
docker run -d --name temp-app nauakavlis/laravel-factory:latest && \
mkdir laravel-app && cd laravel-app && \
docker cp temp-app:/var/www/app/. . && \
docker rm -f temp-app && \
docker run -d -p 8000:8000 --mount type=bind,source="$(pwd)",target=/var/www/app --name laravel nauakavlis/laravel-factory:latest
