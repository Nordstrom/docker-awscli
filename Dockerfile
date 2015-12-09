FROM nordstrom/python:2.7
MAINTAINER Innovation Platform Team "invcldtm@nordstrom.com"

ENV AWSCLI_RELEASE=1.9.11
RUN pip install awscli==${AWSCLI_RELEASE}

ENTRYPOINT ["/usr/local/bin/aws"]
