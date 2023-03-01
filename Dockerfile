FROM python:3.10
#AS builder?

#MAINTAINER ur mom is probably a lovely woman, unlike this code

WORKDIR /opt/status-page
#install requirements
COPY requirements.txt ./
RUN apt-get update && \
    apt-get install -y libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev && \
    pip install --no-cache-dir -r requirements.txt

#COPY ./statuspage/manage.py /app
#COPY ./statuspage/statuspage/settings.py /app
#copy the full directory
COPY . .
#ENV VIRTUAL_ENV=./venv
RUN apt-get update && \
    bash ./upgrade.sh && \
    python3.10 -m venv ./venv 
#ENV PATH="$VIRTUAL_ENV/bin:$PATH"
#ENV PYTHON=/usr/bin/python3.10
EXPOSE 8000 5432 6379

#ENV DJANGO_SETTINGS_MODULE statuspage.settings
#ENTRYPOINT [ "/usr/local/bin/python3" ]
CMD ["python", "/opt/status-page/statuspage/manage.py", "runserver", "0.0.0.0:8000", "--insecure"]
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "statuspage.wsgi:application"]
#ENTRYPOINT [ "/bin/bash" ]
