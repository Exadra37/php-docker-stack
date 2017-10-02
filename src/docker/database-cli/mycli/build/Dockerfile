FROM python:2.7

ENV DEBIAN_FRONTEND=noninteractive

RUN pip install mycli

ENTRYPOINT ["mycli", "--host", "database"]
