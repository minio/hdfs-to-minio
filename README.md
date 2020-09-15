# hdfs-to-minio
Containerized tool to migrate data from HDFS to MinIO

## Create a valid `core-site.xml` for MinIO

Please configure these values for your local deployment
```xml
<configuration>
  <property>
    <name>fs.s3a.path.style.access</name>
    <value>true</value>
  </property>
  <property>
    <name>fs.s3a.endpoint</name>
    <value>https://minio:9000</value>
  </property>
  <property>
    <name>fs.s3a.access.key</name>
    <value>minio-sample</value>
  </property>
  <property>
    <name>fs.s3a.secret.key</name>
    <value>minio-sample123</value>
  </property>
</configuration>
```

## Run `hdfs-to-minio.sh` now

```
export HDFS_SOURCE_PATH=hdfs://namenode:8080/user/minio/testdir
export S3_DEST_PATH=s3a://mybucket/testdir
./hdfs-to-minio.sh
```
