#!/bin/bash

echo "Executing migrations..."

python manage.py migrate

python manage.py collectstatic --noinput

echo "Starting ${DEPLOY_ENV} server..."

if [[ "${DEPLOY_ENV}" == 'PROD' ]]
then
    exec gunicorn -c gunicorn.config.py "${PROJECT_NAME}.wsgi:application"
elif [[ "${DEPLOY_ENV}" == 'DEV' ]]
then
    exec python manage.py runserver 0.0.0.0:8000
fi

echo "Process finished, exiting."
