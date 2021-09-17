FROM openjdk:8-jdk-alpine

MAINTAINER hedu

ADD https://hedutest.nos-eastchina1.126.net/nsf-agent-v2.6.8-c2a5e1f9-20201203-141827.jar /nsf-agent.jar
ADD ./target/hdtest2-0.0.1-SNAPSHOT.jar /hdtest2.jar
ADD ./src/main/resources/nsf.yml /hdtest2.yml
#ADD http://console-poc666.netease.com/download/napm/napm-java-agent-v5.4.2-200522-4d1dcd8d.tar.gz /napm-java-agent542.tar.gz
#RUN tar zxf /napm-java-agent542.tar.gz
#ADD napm-agent.properties /napm-agent.properties



ENTRYPOINT ["java","-Dnsf.log.level=debug","-javaagent:/nsf-agent.jar=hdtest2","-jar","/hdtest2.jar"]
#ENTRYPOINT ["java","-Dnsf.log.level=debug","-javaagent:/nsf-agent.jar=hdtest2","-javaagent:/napm-java-agent/napm-java-rewriter.jar=conf=/napm-agent.properties","-jar","/hdtest2.jar"]
