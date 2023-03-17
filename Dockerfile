FROM python:3.11.1-alpine3.16

ENV AUTH_DBNAME=auth
ENV AUTH_DBUSERNAME=svcauth
ENV AUTH_DBPASSWORD=Pa$$w0rd
ENV AUTH_DBHOST=192.168.88.193
ENV AUTH_DBPORT=5432
ENV HOST_AUTH_APP=192.168.88.198
ENV CORS_AUTH_APP=http://192.168.88.198:4200
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_PASSWORD=mysecret
ENV DJANGO_SUPERUSER_EMAIL=arcik888@gmail.com

WORKDIR /app

COPY . /app/

RUN pip install -r /app/requirements.txt

RUN python /app/manage.py migrate --database=default

# RUN python /app/manage.py createsuperuser --no-input

CMD exec gunicorn apiauth.wsgi:application --bind 0.0.0.0:8000 --workers 2