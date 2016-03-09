#!/bin/bash
docker kill geoserver
docker rm geoserver
docker kill geoserver-postgis
docker rm geoserver-postgis

DATA_DIR=~/geoserver_data
if [ ! -d $DATA_DIR ]
then
    mkdir -p $DATA_DIR
fi 

docker run --name="geoserver-postgis" -t -d kartoza/postgis

docker run \
	--name=geoserver \
	--link geoserver-postgis:postgis \
        -v $DATA_DIR:/opt/geoserver/data_dir \
	-p 8080:8080 \
	-d \
	-e "JAVA_OPTS=-Xms2048m -Xmx2048m -XX:MaxPermSize=128m -server -XX:SoftRefLRUPolicyMSPerMB=36000 -XX:+UseParallelGC" \
	-t kartoza/geoserver \
	/usr/local/bin/startup.sh
