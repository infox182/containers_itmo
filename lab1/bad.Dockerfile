# 1. Используем тяжелый образ Python
FROM python:3.12

# 2. Копируем всё подряд
COPY . /app

# 3. Устанавливаем зависимости
RUN pip install -r /app/requirements.txt

# 4. Указываем порт, который будет использоваться приложением
EXPOSE 5000

# 5. Запускаем приложение
CMD ["python", "/app/app/main.py"]
