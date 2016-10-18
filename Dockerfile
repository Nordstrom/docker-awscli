FROM quay.io/nordstrom/python:2.7
MAINTAINER Nordstrom Kubernetes Platform Team "invcldtm@nordstrom.com"

ARG AWSCLI_VERSION
ENV AWSCLI_VERSION ${AWSCLI_VERSION}

USER root

RUN pip install --upgrade pip \
 && pip install setuptools \
 && pip install awscli==${AWSCLI_VERSION}

USER ubuntu
