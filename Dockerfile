FROM python:3.12-rc-slim-buster

# Update, get bash
RUN apk update && apk add bash && apk add curl

# Required for standalone nuget inspector
RUN apk add libstdc++ && apk add gcompat && apk add icu

# Java
RUN apk --no-cache add openjdk11-jre

ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# Define Docker Image entrypoint
ENTRYPOINT ["/entrypoint.sh"]
