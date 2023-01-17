FROM python:3.10-alpine3.16

COPY entrypoint.sh /entrypoint.sh

# Define Docker Image entrypoint
ENTRYPOINT ["/entrypoint.sh"]
