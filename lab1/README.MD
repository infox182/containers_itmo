# Плохие практики в bad.Dockerfile

### 1. Использование тяжелого базового образа
**Почему плохо:** Увеличивает размер образа, что приводит к замедлению сборки и развертывания.

**Исправление:** Используем минималистичный образ python:3.11-slim.

### 2. Копирование всех файлов из контекста  
**Почему плохо:** Попадают ненужные файлы, такие как .git, временные файлы или личные данные.

**Исправление:** Используем .dockerignore и копируем только нужные файлы.


# Плохие практики в использовании контейнеров

### Отсутствие логирования и мониторинга
**Почему плохо:** Контейнеры запускаются без подключения систем логирования (например, Fluentd), что затрудняет отладку и мониторинг.

### Игнорирование использования volume для данных
**Почему плохо:** Хранение данных внутри контейнера приводит к их потере при перезапуске. Необходимо использовать Docker volumes для персистентного хранения.


# Когда не стоит использовать контейнеры

### Приложения с требованиями к высокой производительности, работающие с аппаратным обеспечением
**Примеры:** задачи HPC (высокопроизводительных вычислений), сильно зависящие от низкого уровня.

### Масштабируемость не является приоритетом
**Пример:** Локальные тестовые системы или прототипы.


