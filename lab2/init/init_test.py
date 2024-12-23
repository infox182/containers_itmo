import requests
import os
import sys
import time

APP_HOST = os.getenv("APP_HOST", "flask_app")
APP_PORT = os.getenv("APP_PORT", "5000")
BASE_URL = f"http://{APP_HOST}:{APP_PORT}"

def wait_for_app():
    retries = 10
    for i in range(retries):
        try:
            response = requests.get(f"{BASE_URL}/tasks")
            if response.status_code == 200:
                print("Приложение готово!")
                return True
        except requests.ConnectionError:
            print(f"Приложение еще не готово, повторная попытка ({i + 1}/{retries})...")
            time.sleep(3)
    return False

def run_tests():
    print("Запуск тестов...")
    
    response = requests.get(f"{BASE_URL}/tasks")
    if response.status_code == 200:
        print("Тест 1 пройден: GET /tasks работает.")
    else:
        print("Тест 1 не пройден: GET /tasks вернул", response.status_code)
        sys.exit(1)

    payload = {"task": "Test task"}
    response = requests.post(f"{BASE_URL}/tasks", json=payload)
    if response.status_code == 201:
        print("Тест 2 пройден: POST /tasks работает.")
    else:
        print("Тест 2 не пройден: POST /tasks вернул", response.status_code)
        sys.exit(1)

    print("Все тесты успешно пройдены!")

if __name__ == "__main__":
    if wait_for_app():
        run_tests()
    else:
        print("Приложение не запустилось вовремя. Тесты прерваны.")
        sys.exit(1)
