FROM tomcat:9-jre8
WORKDIR "/usr/local/tomcat"
COPY  ./target/hello-world.war ./webapps
CMD ["catalina.sh", "run"]