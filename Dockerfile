FROM quay.io/nordstrom/python:2.7
MAINTAINER Store Modernization Platform Team "invcldtm@nordstrom.com"

USER root
ARG AWSCLI_VERSION
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install awscli==${AWSCLI_VERSION}

USER ubuntu

ENTRYPOINT ["/usr/local/bin/aws"]
