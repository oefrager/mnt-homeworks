# Домашнее задание к занятию 15 «Система сбора логов Elastic Stack»

## Задание 1

Поднимаем контейнеры используя директории help :

- elasticsearch (hot и warm ноды);
- logstash;
- kibana;
- filebeat.

Logstash следует сконфигурировать для приёма по tcp json-сообщений.

Filebeat следует сконфигурировать для отправки логов docker вашей системы в logstash.

Результатом выполнения задания должны быть:

- скриншот `docker ps` через 5 минут после старта всех контейнеров (их должно быть 5);

![изображение](https://github.com/user-attachments/assets/28bdb724-e3dd-48b1-8295-4dbc599d1308)

- скриншот интерфейса kibana;

![изображение](https://github.com/user-attachments/assets/5062e354-2133-4a20-a1f2-7f3dd88f61f6)

![изображение](https://github.com/user-attachments/assets/34ffd246-b0b7-4aad-a3e7-ea09cbf6bf1c)

- docker-compose манифест (если вы не использовали директорию help);
- ваши yml-конфигурации для стека (если вы не использовали директорию help).
 

## Задание 2

Перейдите в меню [создания index-patterns  в kibana](http://localhost:5601/app/management/kibana/indexPatterns/create) и создайте несколько index-patterns из имеющихся.

![изображение](https://github.com/user-attachments/assets/0735ef7e-fd26-41a7-993d-1c94b53ff20d)

Запускаю приложение из директории pinger, которое генерирует рандомные события в stdout-контейнера.
Эти логи должны порождать индекс logstash-* в elasticsearch.

![изображение](https://github.com/user-attachments/assets/ac4a2d7e-903b-4e23-b5c9-ca0bef6e4283)

---
