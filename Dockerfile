FROM quay.io/nordstrom/python:2.7
MAINTAINER Nordstrom Kubernetes Platform Team "techk8s@nordstrom.com"

USER root

RUN pip install --upgrade pip \
 && pip install setuptools \
 && pip install awscli==1.11.30

USER ubuntu
