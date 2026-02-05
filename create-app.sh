#!/bin/bash

rm README.md && \

docker build -t nauakavlis/laravel-factory:latest . && \
docker push nauakavlis/laravel-factory:latest && \
docker run -d --name temp-app nauakavlis/laravel-factory:latest && \
docker cp temp-app:/var/www/app/. . && \
docker rm -f temp-app && \
docker run -d -p 8000:8000 --mount type=bind,source="$(pwd)",target=/var/www/app --name laravel nauakavlis/laravel-factory:latest && \

echo "Laravel application is set up and running at http://localhost:8000" && \

rm create-app.sh && \


# git remote add origin <github-repo-url>
# git branch -M main
# git push -u origin main