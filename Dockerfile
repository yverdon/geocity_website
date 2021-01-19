FROM python:3.9.1-slim-buster

ARG PROJECT_NAME
ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV "dev"
ENV DJANGO_SETTINGS_MODULE "${PROJECT_NAME}.settings.dev"

RUN apt-get update && apt-get -yq install --no-install-recommends \
  gcc libpq-dev zlib1g-dev libwebp-dev libpq5 \
  libjpeg-dev libjpeg62-turbo-dev libpng-dev libtiff-dev python3-dev \
  httpie wget curl nano \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -U pip \
  && pip install -U setuptools wheel \
  && pip install -r requirements.txt

COPY . /app/

RUN mv docker-entrypoint.sh /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker-entrypoint.sh \
  && useradd --create-home --shell /bin/bash coderedcms \
  && usermod -u 1234 coderedcms \
  && groupmod -g 4567 coderedcms \
  && chown -R 1234:5678 /app/

USER coderedcms
