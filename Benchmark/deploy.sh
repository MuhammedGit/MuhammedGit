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
apt-get -y install git 
apt-get -y install maven 
apt-get -y install curl
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
cd kafka_2.10-0.8.2.1/config/
cp server.properties server_copy.properties
rm server.properties
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGithub/Muho/Benchmark/conf/kafka/server.properties
cd /usr/local/BDM/apache-storm-0.10.0/conf/
cp storm.yaml storm_copy.yaml
cp storm_env.ini storm_env1.ini
rm storm.yaml
rm storm_env.ini
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGithub/Muho/Benchmark/conf/storm/storm.yaml
wget https://github.com/MuhammedGit/MuhammedGithub/blob/Muho/Benchmark/conf/storm/storm_env.ini
cd /usr/local/BDM/conf/
cp localConf.yaml localConf1.yaml
rm localConf.yaml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGithub/Muho/Benchmark/conf/local/localConf.yaml
cd /usr/local/BDM/zookeeper-3.4.8/conf/
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGithub/Muho/Benchmark/conf/zookeeper/zoo.cfg
chown -R se:se /usr/local/BDM
mkdir /app/zookeeper
mkdir /app/kafka-logs
chown -R se:se /app
