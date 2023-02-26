FROM python:3
MAINTAINER ur mom 

WORKDIR ~/FinalProjectNTT/statuspage

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./manage.py ~/FinalProjectNTT/statuspage/
COPY ./settings.py ~/FinalProjectNTT/statuspage/
COPY . .

RUN #apt-get update && \
    bash ./upgrade.sh && \
    python -m venv ~/FinalProjectNTT/venv && \
    python ./manage.py createsuperuser --no-input --username ubuntu1

EXPOSE 8000

#ENV DJANGO_SETTINGS_MODULE statuspage.settings

#CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "statuspage.wsgi:application"]