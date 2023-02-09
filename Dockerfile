FROM python:3.11.1-alpine3.16

ENV AUTH_DBNAME=auth
ENV AUTH_DBUSERNAME=svcauth
ENV AUTH_DBPASSWORD=Pa$$w0rd
ENV AUTH_DBHOST=192.168.88.193
ENV AUTH_DBPORT=5432

WORKDIR /app

COPY . /app/

RUN pip install -r /app/requirements.txt

EXPOSE 8000

CMD exec gunicorn apiauth.wsgi:application --bind 0.0.0.0:8000 --workers 2