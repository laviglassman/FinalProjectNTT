FROM python:3.10
#AS builder?

#MAINTAINER ur mom 

WORKDIR /opt/status-page
#install requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
#set path as venv perm 


#COPY ./statuspage/manage.py /app
#COPY ./statuspage/statuspage/settings.py /app
#copy the full directory
COPY . .
ENV VIRTUAL_ENV=./venv
RUN apt-get update && \
    bash ./upgrade.sh && \
    python3.10 -m venv $VIRTUAL_ENV 

ENV PATH="$VIRTUAL_ENV/bin:$PATH"
EXPOSE 8000

#ENV DJANGO_SETTINGS_MODULE statuspage.settings

#CMD ["python", "./statuspage/manage.py", "runserver", "127.0.0.1:8000", "--insecure"]
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "status-page.wsgi:application"]
#ENTRYPOINT [ "/bin/bash" ]
