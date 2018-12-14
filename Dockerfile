FROM python:3.7-alpine
RUN apk add --update --no-cache build-base python-dev linux-headers openjdk8 git && \
    pip install esrally
ENTRYPOINT ["esrally"]
