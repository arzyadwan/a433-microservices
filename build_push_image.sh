#!/bin/bash

# Membuat Docker image dari Dockerfile, dengan nama image item-app, dan tag v1
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag item-app:v1 arzyadwan/item-app:v1

# Login ke Docker Hub menggunakan environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u arzyadwan --password-stdin

# Mengunggah image ke Docker Hub
docker push arzyadwan/item-app:v1
