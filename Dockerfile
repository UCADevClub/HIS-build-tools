FROM python:3.11.3-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apk add --update --no-cache postgresql-client

WORKDIR /app

COPY ./HIS-back/requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r requirements.txt && pip freeze

COPY ./HIS-back /app

RUN adduser -D user
USER user

CMD ["python", "manage.py", "runserver", "0.0.0.0:8088"]
