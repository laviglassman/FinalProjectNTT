FROM python:3.10
#AS builder

MAINTAINER ur mom 

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#COPY ./statuspage/manage.py /app
#COPY ./statuspage/statuspage/settings.py /app
COPY . .

RUN apt-get update && \
    bash ./upgrade.sh && \
    python -m venv ~/FinalProjectNTT/venv && \
    python ./statuspage/manage.py createsuperuser --no-input --username lavi --email lavi@example.com

EXPOSE 8000

#ENV DJANGO_SETTINGS_MODULE statuspage.settings

#CMD ["python", "./statuspage/manage.py", "runserver", "127.0.0.1:8000", "--insecure"]
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "statuspage.wsgi:application"]
#ENTRYPOINT [ "/bin/bash" ]
