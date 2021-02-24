FROM harbor-poc666.netease.com/hd-hdpro/openjdk:8-jdk-alpine

MAINTAINER hedu

ADD http://console-poc666.netease.com/download/nsf/nsf-agent-v2.6.6-ae06cc43-20200417-150504.jar /nsf-agent.jar
ADD ./target/hdtest2-0.0.1-SNAPSHOT.jar /hdtest2.jar
ADD hdtest2.yml /hdtest2.yml

ENTRYPOINT ["java","-javaagent:/nsf-agent.jar=hdtest2","-jar","/hdtest2.jar"]

EXPOSE 7002