##### Base is Tomcat on ubuntu #####
FROM tomcat:8.5   

RUN apt update

RUN apt install -y procps
RUN apt install -y vim

##### MYSQL CLIENT #####
RUN apt -y install mysql-client


### Deploy TCGA SpliceSeq ###
COPY TCGASpliceSeq.war /usr/local/tomcat/webapps/
COPY tcgaspliceseq.xml /usr/local/tomcat/conf/
RUN unzip /usr/local/tomcat/webapps/TCGASpliceSeq.war -d /usr/local/tomcat/webapps/TCGASpliceSeq
RUN sed '/<\/Context>/e cat /usr/local/tomcat/conf/tcgaspliceseq.xml' /usr/local/tomcat/conf/context.xml > /usr/local/tomcat/conf/tmp.xml
RUN mv /usr/local/tomcat/conf/context.xml /usr/local/tomcat/conf/context.orig.xml 
RUN mv /usr/local/tomcat/conf/tmp.xml /usr/local/tomcat/conf/context.xml 
COPY mysql-connector-java-3.1.10-bin.jar /usr/local/tomcat/lib
