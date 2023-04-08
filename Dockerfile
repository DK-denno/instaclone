
# pull the official base image
FROM python:3.6.0-slim

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV EMAIL_HOST = 'smtp.gmail.com'
ENV EMAIL_USE_TLS = True
ENV EMAIL_HOST_USER = 'dennisveer27@gmail.com'
ENV EMAIL_HOST_PASSWORD = 'nxezemlddfklhidy'
ENV EMAIL_PORT = 587
ENV SECRET_KEY='Dennisveer27'
ENV DEBUG=True
ENV DB_NAME='insta'
ENV DB_USER='pk'
ENV DB_PASSWORD='sibhon'
ENV DB_HOST='127.0.0.1'
ENV MODE='dev'
ENV ALLOWED_HOSTS='instadk.dk-denno.com'
ENV DISABLE_COLLECTSTATIC=1
ENV pub_key='cf06bb032818882f74de'
ENV secret='1cb78a1c517afe76c55c'

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app
RUN pip install psycopg2-binary
RUN pip install -r requirements.txt


# copy project
COPY . /usr/src/app

EXPOSE 8444

CMD ["python", "manage.py", "runserver", "0.0.0.0:8444"]