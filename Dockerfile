FROM python:3.10
#AS builder?

#MAINTAINER ur mom

WORKDIR /opt/status-page/statuspage
#install requirements
COPY requirements.txt .
RUN apt-get update && \
    apt-get install -y libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev && \
    pip install --no-cache-dir -r requirements.txt

COPY . ..
#ENV VIRTUAL_ENV=./venv
RUN apt-get update && \
    bash ../upgrade.sh && \
    python3.10 -m venv ../venv 
#ENV PATH="$VIRTUAL_ENV/bin:$PATH"
#ENV PYTHON=/usr/bin/python3.10
EXPOSE 8000 5432 6379

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "statuspage.wsgi:application"]
#ENTRYPOINT [ "/bin/bash" ]
