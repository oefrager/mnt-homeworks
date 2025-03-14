# Домашнее задание к занятию 9 «Процессы CI/CD»

## Подготовка к выполнению

1. Создайте две VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).
   ```
   "id" = "158.160.98.81"
    "name" = "nexus-01"

    "id" = "158.160.112.83"
    "name" = "sonar-01"
   ```
2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.
3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.
4. Запустите playbook, ожидайте успешного завершения.
5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).
6. Зайдите под admin\admin, поменяйте пароль на свой.
7. Проверьте готовность Nexus через [бразуер](http://localhost:8081).
8. Подключитесь под admin\admin123, поменяйте пароль, сохраните анонимный доступ.


## Знакомоство с SonarQube

1. Создаеv новый проект, название произвольное.
2. Устанавливаем пакет sonar-scanner, под свою систему.
3. Добавляем ```export PATH=$PATH:$(pwd)```.
4. Проверяем `sonar-scanner --version`.
   ```
   15:06:03.166 INFO  Project root configuration file: NONE
   15:06:03.177 INFO  SonarScanner CLI 7.0.2.4839
   15:06:03.178 INFO  Java 17.0.13 Eclipse Adoptium (64-bit)
   15:06:03.179 INFO  Linux 6.11.0-19-generic amd64
   ```
5. Запускаем анализатор против кода из директории [example](./example):
   ```
   sonar-scanner \
     Dsonar.projectKey=sonarproject \
     Dsonar.sources=. \
     Dsonar.host.url=http://158.160.112.83:9000 \
     Dsonar.login=xxxxxxxxxxxxxxxxxxxxxxx \
     Dsonar.coverage.exclusions=fail.py
   ```
7. Исправляем ошибки, которые он выявил, включая warnings.
8. Запускаем анализатор повторно — проверьте, что QG пройдены успешно:

   ![изображение](https://github.com/user-attachments/assets/fd91d03f-9ecf-4f39-ac12-2915ac16ee0e)


## Знакомство с Nexus

1. В репозиторий `maven-public` загружаем артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.
   
2. Повторяем такой же артефакт, но с version: 8_102.
3. Проверяем, что все файлы загрузились успешно.

   ![изображение](https://github.com/user-attachments/assets/682237ac-ac7f-40d3-9b0e-13febb284b98)

4. В ответе получаем файл [maven-metadata.xml](maven-metadata.xml) для этого артефекта.


### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).
2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.
4. Проверьте `mvn --version`.
   ```
   Apache Maven 3.9.9 
   ```
5. Заберите директорию [mvn](./mvn) с pom.

# Основная часть

1. Правим в `pom.xml` блок с зависимостями.
2. Запустите команду `mvn package`.
3. Проверяем директорию `~/.m2/repository/`.
4. Исправленный файл [pom.xml](pom.xml).
