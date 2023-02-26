FROM python:3.10
#AS builder

MAINTAINER ur mom 

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#COPY ./statuspage/manage.py /app
#COPY ./statuspage/statuspage/settings.py /app
COPY . .

RUN #apt-get update && \
    bash ./upgrade.sh && \
    python -m venv ~/FinalProjectNTT/venv && \
    python ./manage.py createsuperuser --no-input --username ubuntu1

EXPOSE 8000

#ENV DJANGO_SETTINGS_MODULE statuspage.settings

CMD ["python", "./statuspage/manage.py", "runserver", "0.0.0.0:8000"]
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "statuspage.wsgi:application"]
#ENTRYPOINT [ "/bin/bash" ]
