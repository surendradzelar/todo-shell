#!/bin/bash

source components/common.sh

OS_PREREQ

Head "User adding"
deluser suri
useradd -m -s /bin/bash suri &>>$LOG
cd /home/suri/
Stat $?

Head "Downloading component"
rm -rf users
DOWNLOAD_COMPONENT
apt update  &>>$LOG
Stat $?

Head "installing java"
apt install openjdk-8-jre-headless -y &>>$LOG
apt install openjdk-8-jdk-headless -y &>>$LOG
Stat $?

Head "exporting to java-home"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 &>>$LOG
Stat $?

Head "installing maven"
apt install maven -y &>>$LOG
cd /home/suri/users/
Stat $?

Head "installing maven packages"
mvn clean package &>>$LOG
Stat $?

Head "pass the EndPoints in Service File"
sed -i -e "s/REDIS_ENDPOINT/redis.zssurendra.tk/" systemd.service
Stat $?

Head "Setup the systemd Service"
mv systemd.service /etc/systemd/system/users.service &>>$LOG
systemctl daemon-reload && systemctl start users && systemctl enable users && systemctl status users &>>$LOG
Stat $?