FROM docker:dind

# Update, get bash
RUN apk update && apk add bash && apk add curl

# Required for standalone nuget inspector
RUN apk add libstdc++ && apk add gcompat && apk add icu

# Java
RUN apk --no-cache add openjdk11-jre

ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# Download Detect jar
RUN curl -O https://detect.synopsys.com/detect.sh
COPY entrypoint.sh /entrypoint.sh

COPY testing.sh /testing.sh
RUN chmod u+x /testing.sh

# COPY detect.sh /detect.sh
RUN chmod u+x detect.sh
# RUN chmod u+x /entrypoint.sh

# Define Docker Image entrypoint
ENTRYPOINT ["/entrypoint.sh"]
