from mtunique/jstorm
maintainer "xiaomi"

env TZ=Asia/Shanghai


copy booker-0.0.1-SNAPSHOT.jar /opt/jstorm/
copy booker.properties /opt/jstorm/

copy  lib/* /opt/jstorm/lib/
copy  conf/jstorm.logback.xml /opt/jstorm/conf/
copy  conf/storm.yaml /opt/jstorm/conf/


copy start.sh /opt/jstorm/

run  chmod +x /opt/jstorm/start.sh

workdir /opt/jstorm

entrypoint ["sh", "/opt/jstorm/start.sh"]


