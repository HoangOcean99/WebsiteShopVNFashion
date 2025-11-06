# Stage 1: build WAR
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Stage 2: copy WAR vào Tomcat
FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/WebShopFashionMaven-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
