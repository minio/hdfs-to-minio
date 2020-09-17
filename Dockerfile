FROM ubuntu:20.04

RUN apt update --yes && apt upgrade --yes \
    && apt install openjdk-8-jdk wget --yes \
    && wget --quiet https://archive.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz \
    && tar xf hadoop-3.2.1.tar.gz && useradd -d /hadoop-3.2.1 -s /bin/bash hadoop \
    && chown -R 1000:1000 /hadoop-3.2.1

USER hadoop

WORKDIR /hadoop-3.2.1

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV HADOOP_HOME /hadoop-3.2.1
ENV HADOOP_OPTIONAL_TOOLS hadoop-aws
ENV HADOOP_INSTALL $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV YARN_HOME $HADOOP_HOME
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
ENV PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_HOME/lib/native"

ENTRYPOINT [ "hadoop" ]
