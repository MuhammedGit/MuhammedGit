#!/bin/bash
MIRROR=http://www.gtlib.gatech.edu/pub/apache/hadoop/common/hadoop-1.1.1/
VERSION=hadoop-2.7.1

apt-get update
apt-get -y install openjdk-7-jdk

#download hadoop, untar, put in /usr/local
cd ~
cd /Downloads

tar -xzf "$VERSION".tar.gz
mv  $VERSION /usr/local
