FROM ubuntu:jammy
MAINTAINER ur mom 
WORKDIR /app
COPY . .
RUN sudo apt update && sudo apt install postgresql postgresql-contrib redis-server -y
RUN sudo systemctl start postgresql.service
CMD [""]