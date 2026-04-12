# 1단계: Maven으로 빌드
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2단계: Tomcat에 배포
FROM tomcat:10.1-jdk21-temurin
COPY --from=build /app/target/project1.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
