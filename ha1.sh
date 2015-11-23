#!/bin/bash
MIRROR=http://www.gtlib.gatech.edu/pub/apache/hadoop/common/hadoop-1.1.1/
VERSION=hadoop-2.7.1




#download hadoop, untar, put in /usr/local

cd ~/Downloads

tar -xzf "$VERSION".tar.gz
mv  $VERSION /usr/local

#create user and group
addgroup hadoop
adduser --ingroup hadoop hduser
echo user created........................................
# app folder; who uses this ????
mkdir -p /app/hadoop/tmp
chown hduser:hadoop /app/hadoop/tmp
chmod 755 /app/hadoop/tmp

#modify hadoop-env
cd /usr/local/$VERSION/etc/hadoop
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> hadoop-env.sh
echo "export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true" >> hadoop-env.sh

#get configuration files
rm core-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/conf/core-site.xml
rm mapred-site.xml.template
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/conf/mapred-site.xml.template
rm hdfs-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/conf/hdfs-site.xml

# chmod, symbolic links
cd /usr/local
ln -s $VERSION hadoop
chown -R hduser:hadoop $VERSION
echo .......ss baglantisi 
su - hduser -c "echo | ssh-keygen -t rsa -P \"\""
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
su - hduser -c "ssh -o StrictHostKeyChecking=no localhost echo "# login once, to add to known hosts
su - hduser -c "/usr/local/hadoop/bin/hadoop namenode -format"
su - hduser -c "echo | /usr/local/hadoop-2.7.1/sbin/start-all.sh"







