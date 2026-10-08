FROM eclipse-temurin:17-jdk
LABEL maintainer="test_user@gmail.com"
EXPOSE 8080
COPY target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]