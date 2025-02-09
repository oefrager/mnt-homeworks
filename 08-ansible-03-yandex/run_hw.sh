#!/bin/bash

echo
echo "Запуск контейнеров"
docker run -dit --name clickhouse-01 --rm pycontribs/centos:7 sleep 6000000
docker run -dit --name vector-02 --rm pycontribs/ubuntu:latest sleep 6000000
docker run -dit --name lighthouse-03 --rm pycontribs/ubuntu:latest sleep 6000000

docker ps
