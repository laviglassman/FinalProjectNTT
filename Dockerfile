FROM python:3.10
MAINTAINER ur mom 
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN sudo apt update && sudo apt install -y postgresql
RUN sudo systemctl start postgresql && sudo systemctl enable postgresql
EXPOSE 5000
CMD ["python", "manage.py"]