# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).

## Основная часть

1. Создайте новый проект в teamcity на основе fork.
2. Сделайте autodetect конфигурации.

    ![изображение](https://github.com/user-attachments/assets/bb2f947d-0db7-44d9-aee5-7df0ab14e462)

3. Сохраните необходимые шаги, запустите первую сборку master.
4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.

   ![изображение](https://github.com/user-attachments/assets/2e634e99-53a9-4b08-8719-4b510c70f2f2)

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.

   ![изображение](https://github.com/user-attachments/assets/d6ad2834-e9a7-44fa-bbd1-08999a9ba2b5)
    
6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.

   ![изображение](https://github.com/user-attachments/assets/12deb746-d042-4291-a33e-d95a9b87c5fa)

   ![изображение](https://github.com/user-attachments/assets/2fc8048a-a27a-4ee7-bb6a-bd8985d33a8f)

8. Мигрируйте [build configuration]() в репозиторий.
9. Создайте отдельную ветку `feature/add_reply` в репозитории.
10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
12. Сделайте push всех изменений в новую ветку репозитория.
13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.

    ![изображение](https://github.com/user-attachments/assets/7d72376c-d40d-4138-8114-8e9acc738dea)

14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.

    ![изображение](https://github.com/user-attachments/assets/c726deab-e804-477c-9bda-62f25d74dc30)

17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.

    ![изображение](https://github.com/user-attachments/assets/5262a3de-5c3c-4684-9e8f-89552491faee)

19. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.

    ![изображение](https://github.com/user-attachments/assets/06e1916b-247a-4400-bf21-cf39a16b985f)
