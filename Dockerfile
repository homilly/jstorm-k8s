FROM ubuntu:bionic
MAINTAINER mtunique <oatgnem@gmail.com>


# environment variables
ARG JSTORM_VERSION=2.1.1
ARG JSTORM_FILE=jstorm-${JSTORM_VERSION}.zip
ARG JSTORM_URL=https://github.com/alibaba/jstorm/releases/download/${JSTORM_VERSION}/${JSTORM_FILE}
ARG JSTORM_INSTALL_PATH=/opt
ENV JSTORM_HOME $JSTORM_INSTALL_PATH/jstorm
ENV PATH $PATH:$JSTORM_HOME/bin
ENV TZ=Asia/Shanghai

RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless unzip wget python && \
    apt-get clean && \
    mkdir -p "${JSTORM_INSTALL_PATH}" && \
    wget "$JSTORM_URL" -O "$JSTORM_INSTALL_PATH/$JSTORM_FILE" && \
    unzip "${JSTORM_INSTALL_PATH}/jstorm-${JSTORM_VERSION}.zip" -d "${JSTORM_INSTALL_PATH}" && \
    mv "${JSTORM_INSTALL_PATH}/jstorm-${JSTORM_VERSION}" "${JSTORM_HOME}" && \
    mv "${JSTORM_HOME}/conf/storm.yaml" "${JSTORM_HOME}/conf/storm.yaml.template" && \
    chmod +x "$JSTORM_HOME/bin/jstorm" && \
    rm "$JSTORM_INSTALL_PATH/$JSTORM_FILE"

copy  conf/jstorm.logback.xml /opt/jstorm/conf/
copy  conf/storm.yaml /opt/jstorm/conf/

WORKDIR $JSTORM_HOME
