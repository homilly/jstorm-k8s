from mtunique/jstorm
maintainer "xiaomi"

env TZ=Asia/Shanghai


copy  conf/jstorm.logback.xml /opt/jstorm/conf/
copy  conf/storm.yaml /opt/jstorm/conf/


copy start.sh /opt/jstorm/

run  chmod +x /opt/jstorm/start.sh
