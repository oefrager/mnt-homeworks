#!/bin/bash

echo
echo "Запуск контейнеров"
docker run -dit --name centos7 --rm pycontribs/centos:7 sleep 6000000
docker run -dit --name ubuntu --rm pycontribs/ubuntu:latest sleep 6000000
docker run -dit --name fedora --rm pycontribs/fedora sleep 6000000
docker ps

echo
echo "Запуск ansible-playbook"
cd playbook
ansible-playbook site.yml -i inventory/prod.yml

echo
echo "Остановка контейнеров"
docker stop $(docker ps -qa)
docker ps -a
