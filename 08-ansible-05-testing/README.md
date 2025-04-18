# Домашнее задание к занятию 5 «Тестирование roles»

## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.
2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.
   ```
   (base):~$ molecule  --version
    molecule 6.0.3 using python 3.9 
    ansible:2.15.13
    default:6.0.3 from molecule
    docker:2.1.0 from molecule_docker requiring collections: community.docker>=3.0.2 ansible.posix>=1.4.0
    podman:2.0.3 from molecule_podman requiring collections: containers.podman>=1.7.0 ansible.posix>=1.3.0
   ```

## Основная часть

### Molecule

1. Запускаем  `molecule test -s ubuntu_xenial` внутри корневой директории clickhouse-role, получаем ошибки выполнения:
  ```
  (base):~/clickhouse$ molecule test -s ubuntu_xenial
  WARNING  Driver docker does not provide a schema.
  CRITICAL Failed to validate /home/goi/Netology_src/ansible/08-ansible-05-testing/roles/clickhouse/molecule/ubuntu_xenial/molecule.yml
  ["Additional properties are not allowed ('playbooks' was unexpected)"]
  ```
2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.
3. Добавил дистрибутивы: oraclelinux:8, ubuntu:latest для инстансов и запустил тест роли.
   ```
   
   ```
4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 
5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
5. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.

   ![изображение](https://github.com/user-attachments/assets/48c7c677-5958-400d-8ff9-6281d6926d82)

4. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
   ```
   molecule init scenario tox --driver-name=podman
   ```
5. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.:
   ```
   {posargs:molecule test -s tox --destroy always}
   ```
6. Запустите команду `tox`. Убедитесь, что всё отработало успешно.

7. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания. 
