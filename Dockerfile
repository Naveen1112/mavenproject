FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install openjdk-8-jre -y
RUN echo "JAVA_HOME=/usr/" >> ~/.bashrc
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.71/bin/apache-tomcat-8.5.71.tar.gz /tmp
RUN cd /tmp && tar -zxvf apache-tomcat-8.5.71.tar.gz
RUN cd /tmp && mv  apache-tomcat-8.5.71 /opt/
EXPOSE 8080
ADD target/mavenproject.war /opt/apache-tomcat-8.5.71/webapps
CMD ["/opt/apache-tomcat-8.5.71/bin/catalina.sh", "run"]
