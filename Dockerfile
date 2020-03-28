FROM python:3

RUN mkdir /app
WORKDIR /app

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app/src
CMD [ "python", "/app/src/docker_test.py" ]
