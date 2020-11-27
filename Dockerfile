FROM python:3.8.6-alpine
WORKDIR /website/
RUN mkdir db
COPY . .
RUN apk add --no-cache --virtual build-deps gcc python3-dev musl-dev
RUN apk add --no-cache jpeg-dev zlib-dev
RUN pip install -r requirements.txt
RUN apk del build-deps
EXPOSE 8080
CMD python manage.py runserver 0.0.0.0:8080