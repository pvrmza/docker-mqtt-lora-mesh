FROM eclipse-mosquitto
LABEL maintainer="Pablo A. Vargas <pablo@pampa.cloud>"

COPY files/mesh-server-orig.tgz /root
COPY files/mosquitto.conf /mosquitto/config/mosquitto.conf
COPY files/passwd /mosquitto/config/passwd
COPY files/docker-entrypoint.sh /sbin/

RUN chmod 755 /sbin/docker-entrypoint.sh && cd /root && tar -zxvf mesh-server-orig.tgz && \
 cd mesh-server && apk update && apk add npm && \
 npm install express@4.16.3 jquery@3.3.1 mqtt@2.18.8 p5@0.7.2 rxjs@6.3.2 socket.io@2.1.1 
 

ENTRYPOINT ["/sbin/docker-entrypoint.sh"]