FROM python:3
ARG CFNL_VER=0.18.1
ARG BUILD_DATE=now
ARG VCS_VER=dev

LABEL maintainer=ian.martin@polarisalpha.com license=MIT copyright="Solidyn Solutions, LLC." \
  org.label-schema.build-date=$BUILD_DATE org.label-schema.vcs-ref=$VCS_VER \
  org.label-schema.name=cfn-lint org.label-schema.description="cfn-lint checks and validates AWS CloudFormation templates" \
  org.label-schema.url='https://www.polarisalpha.com' org.label-schema.schema-version=1.0

RUN pip install cfn-lint==$CFNL_VER

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
