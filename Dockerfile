FROM nordstrom/python:2.7
MAINTAINER Innovation Platform Team "invcldtm@nordstrom.com"

RUN pip install awscli

ENTRYPOINT ["/usr/local/bin/aws"]
