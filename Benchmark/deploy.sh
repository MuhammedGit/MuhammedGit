#!/bin/bash

cd ~/Downloads
wget https://github.com/yahoo/streaming-benchmarks/archive/master.zip
wget http://ftp.itu.edu.tr/Mirror/Apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz

unzip master.zip
tar xzf zookeeper-3.4.8.tar.gz

mkdir /usr/local/BDM
cp -r zookeeper-3.4.8 /usr/local/BDM
cd streaming-benchmarks-master/
cp -r ./* /usr/local/BDM
chown -R se:se /usr/local/BDM
apt-get -y install git maven curl
cd /usr/local/BDM
git init ./
rm pom.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGithub/Muho/Benchmark/conf/pom.xml
cp stream-bench.sh stream-bench_copy.sh
rm stream-bench.sh
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGithub/Muho/Benchmark/stream-bench.sh
chmod a+x stream-bench.sh
cp -r /usr/local/hadoop/ ./
chown -R se:se /usr/local/BDM
./stream-bench.sh SETUP


mkdir /app/zookeeper
mkdir /app/kafka-logs
chown -R se:se /app
