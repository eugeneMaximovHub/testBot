FROM python:3.8

WORKDIR /home

ENV TELEGRAM_API_TOKEN="5368490313:AAFarv7UbqyKGstUlaHb7OU34S5QNUS6h-g"
ENV TELEGRAM_ACCESS_ID="697687812"


ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip install -U pip aiogram pytz && apt-get update && apt-get install sqlite3
COPY *.py ./
COPY createdb.sql ./

ENTRYPOINT ["python", "main.py"]