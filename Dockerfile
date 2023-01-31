FROM http://docker.repo.orl.eng.hitachivantara.com/docker:dind

# Update, get bash
RUN apk update && apk add bash && apk add curl

# Required for standalone nuget inspector
RUN apk add libstdc++ && apk add gcompat && apk add icu

# Java
RUN apk --no-cache add openjdk11-jre

ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# dotnet
RUN apk add dotnet7-sdk

# set up maven
ARG MAVEN_VERSION=3.6.3
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
 && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
 && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
 && rm -f /tmp/apache-maven.tar.gz \
 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Download Detect jar
ARG DETECT_SOURCE=https://sig-repo.synopsys.com/artifactory/bds-integrations-release/com/synopsys/integration/synopsys-detect/8.3.0/synopsys-detect-8.3.0.jar

RUN if [ $(curl --silent -L -w '%{http_code}' -o /synopsys-detect.jar --create-dirs ${DETECT_SOURCE}) != "200" ]; then echo "Unable to download Detect jar from ${DETECT_SOURCE}"; exit 1; fi

# Define Docker Image entrypoint
# ENTRYPOINT ["java", "-jar", "/synopsys-detect.jar", "--detect.source.path=.", "--detect.output.path=.", "--detect.phone.home.passthrough.invoked.by.image=true"]
ENTRYPOINT ["/entrypoint.sh"]

# FROM docker:dind

# # Update, get bash
# RUN apk update && apk add bash && apk add curl

# # Required for standalone nuget inspector
# RUN apk add libstdc++ && apk add gcompat && apk add icu

# # Java
# RUN apk --no-cache add openjdk11-jre

# ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# # Download Detect jar
# # RUN curl -O https://detect.synopsys.com/detect.sh
# COPY entrypoint.sh /entrypoint.sh

# COPY testing.sh /testing.sh
# RUN chmod u+x /testing.sh

# # COPY detect.sh /detect.sh
# # RUN chmod u+x detect.sh
# # RUN chmod u+x /entrypoint.sh

# # Define Docker Image entrypoint
# ENTRYPOINT ["/entrypoint.sh"]

