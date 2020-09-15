#!/bin/bash

set -e

if [ ! -f core-site.xml ]; then
    echo "please create a core-site.xml here is the sample, please edit it accordingly"
    cat core-site.xml
fi

echo "Migrating data from ${HDFS_SOURCE_PATH} ${S3_DEST_PATH}"
docker run --rm -v ${PWD}/core-site.xml:/hadoop-3.2.1/etc/hadoop/core-site.xml \
       minio/hadoop:3.2.1 fs -cp ${HDFS_SOURCE_PATH} ${S3_DEST_PATH}
