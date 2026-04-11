FROM tomcat:10.1-jdk21-temurin

# 기존 웹앱 삭제
RUN rm -rf /usr/local/tomcat/webapps/*

# 프로젝트 전체를 ROOT로 복사
COPY ./ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]
