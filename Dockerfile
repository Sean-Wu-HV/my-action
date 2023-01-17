FROM python:3.12-rc-slim-buster

COPY entrypoint.sh /entrypoint.sh

# Define Docker Image entrypoint
ENTRYPOINT ["/entrypoint.sh"]
