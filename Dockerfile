FROM python:3.7-alpine
RUN apk add --update --no-cache build-base python-dev linux-headers openjdk8-jre git \
  && pip install --no-cache-dir esrally
ENTRYPOINT ["esrally"]
