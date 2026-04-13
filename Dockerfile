FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY project1/src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

COPY project1/src/main/java/ /tmp/java/

RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    /tmp/java/login/*.java

EXPOSE 8080

CMD ["catalina.sh", "run"]
