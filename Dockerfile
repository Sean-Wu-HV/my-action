FROM python:3.12-rc-slim-buster

RUN pip3 install poetry
COPY entrypoint.sh /entrypoint.sh

# Define Docker Image entrypoint
ENTRYPOINT ["/entrypoint.sh"]
