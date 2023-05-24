FROM python:3.10-slim

ENV PYTHONUNBUFFERED true
ENV TZ Europe/Paris

RUN apt-get update && apt-get install -y gcc python3-dev libcairo2-dev libpango-1.0.0 libpangocairo-1.0-0 postgresql-client-common postgresql libpq-dev libssl-dev ffmpeg libsm6 libxext6


RUN pip install --upgrade pip

COPY ./requirements /code/requirements/
WORKDIR /code
RUN pip install -r /code/requirements/prod.txt
COPY . /code

CMD python app/main.py
