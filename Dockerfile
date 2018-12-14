FROM python:3.7
RUN pip install esrally
ENTRYPOINT ["esrally"]
