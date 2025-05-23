# Logomancy (AI-powered Log Analysis)
Tool for AI systemd logs analitic

## Описание

Программа для анализа логов systemd (Linux). Собирает логи с помощью journalctl и аналилизирует с помощью AI (Gemini, llama.cpp)

## Установка

### Предварительные требования

Linux (systemd)
Python >= 3.12
llama.cpp - Для работы в автомномном режиме

### Шаги установки

1. Клонируйте репозиторий:

```bash
git clone https://github.com/ta0ma0/Logomancy.git
cd Logomancy
```

2. Создайте витуальное окружение
```
python3 -m venv venv
source venv/bin/activate
```

3. Установите зависимости

```bash
pip install -r requirements.txt
```
4. Настройте .env

Обязательные поля для уведомления в Telegram.
```
BOT_TOKEN = xxxxxxxxxxxxxxxxxxxxxxxxxxx # Токен бота, взять у Botfather (предварительно надо создать)
CHAT_ID = xxxxxxx # Идентификатор вашего чата (предварительно надо создать), можно увидеть в Web интерфейсе телеграмма в адресной строке.
```
5. Скачайте LLM  и положите в MODEL_PATH (.env) директори (по умолчанию "models"), либо укажите путь до уже существующей. Тестировалось и создавалось с google_gemma-3-12b-it-GGUF [HuggingFace](https://huggingface.co/)

## Использование

1. Перед использованием произвести тестовый запуск. SUDO используется для плучения доступа к файлом логов с помощю journalctl. В дальнейшем работа программы производится из под обычного пользователя.


Из директории с программой.
```
sudo ./run.sh
```

2. Если программа завершилась без ошибок, вы видите отчет data/ai_summary.md. Добавьте cron задание для root

```
sudo crontab -e

Например:

00 10 * * * /path_to_programm/run.sh
```

## Возможные проблемы

Если при первом тестовом запуске ```sudo ./run.sh``` вы получаете ошибку типа:

```
Traceback (most recent call last):
  File "/home/ruslan/opt/Logomancy/logs_analiser_llama.py", line 30, in <module>
    AI_RESULT_FILE = os.path.join(PROJECT_ROOT, "data", "reports", "ai_result_llama.txt")
  File "<frozen posixpath>", line 77, in join
TypeError: expected str, bytes or os.PathLike object, not NoneType
```
Вам нужно заполнить переменную PROJECT_ROOT в .env файле.

Узнать можно командой pwd из проекта.

# README ENGLISH VERSION


# Logomancy (AI-powered Log Analysis)
Tool for AI systemd logs analytics

## Description

A program for analyzing systemd logs (Linux). It collects logs using journalctl and analyzes them with AI (Gemini, llama.cpp).

## Installation

### Prerequisites

* Linux (systemd)
* Python >= 3.12
* llama.cpp - For offline operation

### Installation Steps

1.  Clone the repository:

    ```bash
    git clone [https://github.com/ta0ma0/Logomancy.git](https://github.com/ta0ma0/Logomancy.git)
    cd Logomancy
    ```

2. Create venv enviroment

```
python3 -m venv venv
source venv/bin/activate
```

3.  Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

4.  Configure `.env`:

    Mandatory fields for Telegram notifications:

    ```
    BOT_TOKEN = xxxxxxxxxxxxxxxxxxxxxxxxxxx # Your bot token, obtained from BotFather (you need to create a bot first)
    CHAT_ID = xxxxxxx # Your chat ID (you need to create a chat first), can be found in the Telegram web interface address bar.
    ```
    
5. Download LLM model and put into MODEL_PATH (.env) directory (default "models") For example: google_gemma-3-12b-it-GGUF [HuggingFace](https://huggingface.co/)

## Usage

1.  Before using, perform a test run. SUDO is used to gain access to log files using journalctl. Subsequently, the program can be run by a regular user.

    From the program directory:

    ```bash
    sudo ./run.sh
    ```

2.  If the program finishes without errors, you will see a report in `data/ai_summary.md`. Add a cron job for root:

    ```bash
    sudo crontab -e

    For example:

    00 10 * * * path_to_programm/run.sh
    ```

## Possible troubles

If you got

```
Traceback (most recent call last):
  File "/home/ruslan/opt/Logomancy/logs_analiser_llama.py", line 30, in <module>
    AI_RESULT_FILE = os.path.join(PROJECT_ROOT, "data", "reports", "ai_result_llama.txt")
  File "<frozen posixpath>", line 77, in join
TypeError: expected str, bytes or os.PathLike object, not NoneType
```
Fill PROJECT_ROOT in .env file
