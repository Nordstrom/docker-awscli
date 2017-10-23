FROM quay.io/nordstrom/python:2.7
MAINTAINER Nordstrom Kubernetes Platform Team "techk8s@nordstrom.com"

ARG AWSCLI_VERSION
ENV AWSCLI_VERSION ${AWSCLI_VERSION}

USER root

RUN pip install --upgrade pip \
 && pip install setuptools \
 && pip install awscli==${AWSCLI_VERSION}

USER nordstrom
