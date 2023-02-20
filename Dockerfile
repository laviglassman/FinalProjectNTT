FROM python:3.10
MAINTAINER ur mom 
WORKDIR /app
COPY . /app
RUN sudo pip install -r requirements.txt
RUN sudo apt update && sudo apt install postgresql postgresql-contrib redis-server -y
RUN sudo systemctl start postgresql.service
EXPOSE 5000
CMD ["python", "manage.py"]