FROM tomcat:latest
WORKDIR "/usr/local/tomcat"
COPY  ./target/hello-world.war ./webapps
CMD ["catalina.sh", "run"]