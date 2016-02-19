#!/bin/bash
VERSION=hadoop-2.7.2

cd ~/Downloads


tar -xzf "$VERSION".tar.gz
cd ~/usr/local/
mkdir big
mv  $VERSION /usr/local/big/



mkdir -p /app1/hadoop/tmp

chmod 755 /app1/hadoop/tmp

cd /usr/local/big
mv $VERSION hadoop

#modify hadoop-env
cd /usr/local/big/hadoop/etc/hadoop

#echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> hadoop-env.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> hadoop-env.sh
echo "export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true" >> hadoop-env.sh

rm core-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/core-site.xml

wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/mapred-site.xml
rm hdfs-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/hdfs-site.xml
rm yarn-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/yarn-site.xml


