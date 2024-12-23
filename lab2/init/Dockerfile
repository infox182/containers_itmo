FROM python:3.12-slim

WORKDIR /init

COPY init_test.py .
COPY requirements.txt .

RUN pip install -r requirements.txt

CMD ["python", "init_test.py"]
