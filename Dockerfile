FROM openjdk:21
ADD target/docker-sample-0.0.1-SNAPSHOT.jar java-docker-sample.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "java-docker-sample.jar"]
