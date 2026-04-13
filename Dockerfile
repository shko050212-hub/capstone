FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

# JSP를 ROOT 바로 아래로
COPY main/webapp/ /usr/local/tomcat/webapps/ROOT/

# 클래스 폴더 생성
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Java 소스 복사
COPY main/java/ /tmp/java/

# 컴파일
RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    /tmp/java/login/*.java

EXPOSE 8080

CMD ["catalina.sh", "run"]
