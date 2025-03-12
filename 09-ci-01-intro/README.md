# Домашнее задание к занятию 7 «Жизненный цикл ПО»

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

      ![изображение](https://github.com/user-attachments/assets/90267d57-8dc8-4e55-a41b-98591940d67f)

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

      ![изображение](https://github.com/user-attachments/assets/120c8a57-3c84-4713-bfe9-7927b2d24de4)

**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done. 

      ![изображение](https://github.com/user-attachments/assets/d0bf48c9-ae97-4441-8b19-7aea8c79e2cd)

2. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done. 

      ![изображение](https://github.com/user-attachments/assets/d6b9fee8-bf25-4bf4-ba41-1071e65c6e5e)

3. При проведении обеих задач по статусам используйте kanban. 
4. Верните задачи в статус Open.
5. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.

      ![изображение](https://github.com/user-attachments/assets/0a19da6e-5ab8-49fd-bf82-f19ca4176e74)

6. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

---
   Схемы workflow:
   - [bug](Workflow_bug.xml)
   - [task](Workflow_task.xml)
