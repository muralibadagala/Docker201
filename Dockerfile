FROM tomcat:8.0
LABEL maintainer="suyash.gupta@mindtree.com"
ADD target/Spring201-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/AssigningTask.war
EXPOSE 8080
CMD ["catalina.sh","run"]
