FROM mcr.microsoft.com/java/jdk:8u192-zulu-alpine
WORKDIR "/app"


RUN apk update; \
apk add bash; \
apk add curl; \
curl -L https://services.gradle.org/distributions/gradle-2.3-bin.zip -o gradle-2.3-bin.zip; \
mkdir /opt; \
mkdir /opt/gradle; \
unzip -d /opt/gradle gradle-2.3-bin.zip; \
export PATH=$PATH:/opt/gradle/gradle-2.3/bin;gradle wrapper;

COPY . /app

RUN ./gradlew build;

EXPOSE 8080
