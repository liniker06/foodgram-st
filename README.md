Запуск проекта через Docker

1. Установите Docker

2. Клонируйте репозиторий: https://github.com/liniker06/foodgram-st.git

3. Выполните команды в терминале:
```
cd ../infra
docker-compose up -d --build
```
4. Выполните миграции
```
docker-compose exec backend python manage.py migrate
```
5. Создание суперпользователя
```
docker-compose exec backend python manage.py createsuperuser
```
6. Загрузка статических файлов:
```
docker-compose exec backend python manage.py collectstatic --no-input
```
7. Заполнение тестовыми данными:
```
docker-compose exec backend python manage.py add_tags_from_data
docker-compose exec backend python manage.py add_ingidients_from_data   
```
