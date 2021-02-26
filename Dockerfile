FROM openjdk:8-jdk-alpine

MAINTAINER hedu

ADD http://console-poc666.netease.com/download/nsf/nsf-agent-v2.6.6-ae06cc43-20200417-150504.jar /nsf-agent.jar
ADD ./target/hdtest2-0.0.1-SNAPSHOT.jar /hdtest2.jar
ADD hdtest2.yml /hdtest2.yml
ADD http://console-poc666.netease.com/download/napm/napm-java-agent-v5.4.2-200522-4d1dcd8d.tar.gz /napm-java-agent542.tar.gz
RUN tar zxf /napm-java-agent542.tar.gz
ADD napm-agent.properties /napm-agent.properties



#ENTRYPOINT ["java","-javaagent:/nsf-agent.jar=hdtest2","-jar","/hdtest2.jar"]
ENTRYPOINT ["java","-Dnsf.log.level=debug","-javaagent:/nsf-agent.jar=hdtest1","-javaagent:/napm-java-agent/napm-java-rewriter.jar=conf=/napm-agent.properties","-jar","/hdtest1.jar"]
