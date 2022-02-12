# Download image for python3.9
FROM python:3.9-buster
LABEL maintainer="marcovnyc@gmail.com"
LABEL version="0.1"
LABEL description="devops-challenge container"

ARG DEBIAN_FRONTEND=noninteractive

 RUN apt-get update && apt-get -y install default-libmysqlclient-dev default-mysql-client

ARG PROJECT=devops-challenge
ARG PROJECT_DIR=/var/www/${PROJECT}



RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
ADD . $PROJECT_DIR

COPY Pipfile Pipfile.lock ./
RUN pip3 install -U pipenv
RUN pipenv install --system

# django server
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python3", "schoolapp/manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
