FROM python:3
MAINTAINER ur mom 

WORKDIR /opt/status-page/statuspage

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY manage.py /opt/status-page/statuspage/
COPY settings.py /opt/status-page/statuspage/
COPY . .

RUN #apt-get update && \
    bash ./upgrade.sh && \
    python -m venv /opt/status-page/venv && \
    python ./manage.py createsuperuser --no-input --username ubuntu1

EXPORT 8000

#ENV DJANGO_SETTINGS_MODULE statuspage.settings

#CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "statuspage.wsgi:application"]