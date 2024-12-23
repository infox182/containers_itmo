FROM python:3.12-slim

WORKDIR /opt/app

# Установка зависимостей PostgreSQL
RUN apt-get update \
    && apt-get install -y libpq-dev gcc \
    && apt-get clean

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY main.py .

EXPOSE 5000

CMD ["python", "main.py"]
