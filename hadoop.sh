#!/bin/bash
MIRROR=http://www.gtlib.gatech.edu/pub/apache/hadoop/common/hadoop-1.1.1/
VERSION=hadoop-2.7.1

apt-get update
apt-get -y install openjdk-7-jdk

#download hadoop, untar, put in /usr/local
cd /Downloads

tar -xzf "$VERSION".tar.gz
mv  $VERSION /usr/local


# create user and group
addgroup hadoop
useradd  -G hadoop hduser -s /bin/bash -m

# app folder; who uses this ????
mkdir -p /app/hadoop/tmp
chown -R hduser.hadoop /app/hadoop/tmp
chmod 750 /app/hadoop/tmp

#modify hadoop-env
cd /usr/local/$VERSION/conf
echo "export JAVA_HOME=/usr" >> hadoop-env.sh
echo "export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true" >> hadoop-env.sh


#get configuration files
rm core-site.xml
wget http://webprod11.megashares.com/index.php?d01=TZop5IS&lccdl=83a9555b6c9ec15c&d01go=1&fln=/core-site.xml
rm mapred-site.xml.template
wgethttp://webprod13.megashares.com/index.php?d01=xnu4Uvv&lccdl=83a9555b6c9ec15c&d01go=1&fln=/mapred-site.xml.template
rm hdfs-site.xml
wget http://webprod11.megashares.com/index.php?d01=9rbEHVP&lccdl=83a9555b6c9ec15c&d01go=1&fln=/hdfs-site.xml

# chmod, symbolic links
cd /usr/local
ln -s $VERSION hadoop
chown -R hduser.hadoop $VERSION
chown hduser.hadoop $VERSION

su - hduser -c "/usr/local/hadoop/bin/hadoop namenode -format"

#ssh stuff
su - hduser -c "echo | ssh-keygen -t rsa -P \"\""
cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
su - hduser -c "ssh -o StrictHostKeyChecking=no localhost echo "# login once, to add to known hosts

su - hduser -c "/usr/local/hadoop/bin/hadoop namenode -format"
