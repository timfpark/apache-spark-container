FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install curl

# JAVA
ENV JAVA_HOME /usr/local/jdk1.8.0_102

ENV PATH $PATH:$JAVA_HOME/bin
COPY jre-8u121-linux-x64.tar.gz /tmp/jre-8u121-linux-x64.tar.gz
RUN tar -xz /tmp/jre-8u121-linux-x64.tar.gz -C /usr/local/ && ln -s $JAVA_HOME /usr/local/java
RUN rm /tmp/jre-8u121-linux-x64.tar.gz

# SPARK
ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
ENV SPARK_HOME /usr/local/spark-2.1.0-bin-hadoop2.7

ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C /usr/local/

WORKDIR $SPARK_HOME