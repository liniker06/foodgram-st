FROM python:3.10

# Устанавливаем netcat для проверки DB
RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Сначала requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Отдельно устанавливаем gunicorn
RUN pip install gunicorn==20.1.0

# Копируем проект
COPY . .

# Команда запуска
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "foodgram.wsgi:application"]
