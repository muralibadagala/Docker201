FROM ubuntu:latest
WORKDIR /tmp/docker
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install git
RUN apt-get -y install openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get -y update && apt-get -y install maven
RUN git clone https://github.com/Suyash-g/AssigningTask.git
RUN cd AssigningTask && mvn clean install -Dmaven.test.skip=true
RUN mkdir /usr/local/tomcat
ADD http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz  /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.33/* /usr/local/tomcat/
EXPOSE 8090
RUN cp /tmp/docker/AssigningTask/target/Spring201-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/Spring201-0.0.1-SNAPSHOT.war
CMD /usr/local/tomcat/bin/catalina.sh run
