FROM python:3.12-rc-slim-buster

# Update, get bash
RUN apt-get update && apt-get install bash curl git

# Define Docker Image entrypoint
ENTRYPOINT ["/entrypoint.sh"]
