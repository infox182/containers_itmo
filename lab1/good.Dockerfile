# 1. Используем lightweight-образ
FROM python:3.12-slim

# 2. Указываем рабочую директорию
WORKDIR /opt/app

# 3. Копируем файл с зависимостями и устанавливаем их
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# 4. Копируем только нужные файлы
COPY ./app .

# 5. Указываем порт, который будет использоваться приложением
EXPOSE 5000

# 6. Запускаем приложение
CMD ["python", "main.py"]
