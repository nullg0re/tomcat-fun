FROM debian

MAINTAINER nullg0re@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apt update
RUN apt install -y curl
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.tar.gz
RUN tar xf apache-tomcat-8.5.87.tar.gz
RUN mv apache-tomcat-8.5.87/* /opt/tomcat/.
COPY tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
COPY context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
RUN apt -y install default-jre
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
