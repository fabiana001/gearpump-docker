# Docker file
FROM errordeveloper/oracle-jre

ENV GP_VERSION 0.8.1

# Prepare the package
RUN  curl --location  --retry 3 --insecure https://github.com/gearpump/gearpump/releases/download/$GP_VERSION/gearpump-2.11-$GP_VERSION.zip -o tmp.z$
unzip -q tmp.zip && \
rm tmp.zip && \
chmod +x gearpump-2.11-$GP_VERSION/bin/

ADD gear.conf gearpump-2.11-$GP_VERSION/conf/gear.conf

EXPOSE 3000 8090

ENTRYPOINT gearpump-2.11-$GP_VERSION/bin/local -workernum 1 & gearpump-2.11-$GP_VERSION/bin/services
