FROM nimmis/alpine-java:oracle-8-jdk
MAINTAINER domnulnopcea

RUN apk --no-cache add curl && apk --no-cache add bash && apk --no-cache add python && apk --no-cache add vim && apk --no-cache add mc

ENV TERM xterm
ENV HBASE_MAJOR 1.1
ENV HBASE_MINOR 6
ENV HBASE_VERSION "${HBASE_MAJOR}.${HBASE_MINOR}"
RUN curl -s http://apache.javapipe.com/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz | tar -xz -C /usr/local/
RUN ln -s /usr/local/hbase-$HBASE_VERSION /usr/local/hbase
ENV HBASE_HOME /usr/local/hbase
ENV PATH $PATH:$HBASE_HOME/bin
ENV HBASE_CONF_PATH $HBASE_HOME/conf
ENV PATH $PATH:$HBASE_CONF_PATH

RUN $HBASE_HOME/bin/hbase-config.sh
ADD hbase-site.xml $HBASE_HOME/conf/hbase-site.xml

ADD start-pseudo-distributed.sh $HBASE_HOME/bin/start-pseudo-distributed.sh

RUN chown root:root $HBASE_HOME/bin/start-pseudo-distributed.sh
RUN chmod 700 $HBASE_HOME/bin/start-pseudo-distributed.sh

CMD ["/usr/local/hbase/bin/start-pseudo-distributed.sh", "-bash"]

# HBase Master API port
EXPOSE 60000

# HBase Master Web UI
EXPOSE 60010

# Regionserver API port
EXPOSE 60020

# HBase Regionserver web UI
EXPOSE 60030