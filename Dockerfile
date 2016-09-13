FROM quay.io/nordstrom/python:2.7
MAINTAINER Nordstrom Kubernetes Platform Team "stmdrnztnpfrm@nordstrom.com"

USER root
ARG AWSCLI_VERSION
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install awscli==${AWSCLI_VERSION}

ENTRYPOINT ["/usr/local/bin/aws"]
