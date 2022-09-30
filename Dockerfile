FROM maven:3.8.4-jdk-11-slim AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean -Dquarkus.package.type=uber-jar package

FROM registry.access.redhat.com/ubi8/openjdk-11:latest
COPY --from=build /usr/src/app/target/fake-webhook-runner.jar /usr/app/fake-webhook-runner.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/fake-webhook-runner.jar"]