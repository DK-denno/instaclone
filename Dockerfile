# pull the official base image
FROM python:3.10-slim


# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app
RUN apt-get update && apt-get install -y ca-certificates
RUN pip install --trusted-host pypi.python.org -r requirements.txt


# copy project
COPY . /usr/src/app

EXPOSE 8444

CMD ["python", "manage.py", "runserver", "0.0.0.0:8444"]