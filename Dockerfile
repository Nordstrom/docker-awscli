FROM nordstrom/python:2.7
MAINTAINER Innovation Platform Team "invcldtm@nordstrom.com"

ARG --description="AWS CLI version" AWSCLI_RELEASE
RUN pip install awscli==${AWSCLI_RELEASE}

ENTRYPOINT ["/usr/local/bin/aws"]
