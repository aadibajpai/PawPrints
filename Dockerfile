FROM python:3.6-alpine3.6
ENV PYTHONUNBUFFERED 1

RUN apk update 
RUN apk add postgresql-libs gcc
RUN apk add musl-dev postgresql-client postgresql-dev pkgconfig
RUN apk add build-base libressl libffi-dev libressl-dev libxslt-dev libxml2-dev xmlsec-dev xmlsec

RUN pip install -U pip

RUN mkdir /PawPrints

WORKDIR /PawPrints

ADD ./requirements.txt /PawPrints/requirements.txt
RUN pip install -r requirements.txt

ADD . /PawPrints
