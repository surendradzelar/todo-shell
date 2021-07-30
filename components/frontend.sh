#!/bin/bash

source components/common.sh

DOMAIN=zssurendra.tk

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "installing NPM"
apt install npm -y &>>$LOG
Stat $?

Head "Create directory"
cd /var/www/html/
mkdir suri &>>$LOG
cd suri
rm -rf frontend
Stat $?

Head "Downloading Component"
DOWNLOAD_COMPONENT
cd frontend
Stat $?

Head "run and build npm"
npm install -g npm@latest &>>$LOG
npm install shelljs &>>$LOG
npm install --save-dev  --unsafe-perm node-sass &>>$LOG
npm run build  &>>$LOG
Stat $?

Head "Replacing domain names"
sed -i '32 s/127.0.0.1/login.zssurendra.tk/g' /var/www/html/suri/frontend/config/index.js
sed -i '36 s/127.0.0.1/todo.zssurendra.tk/g' /var/www/html/suri/frontend/config/index.js
Stat $?

Head "start and restart Nginx"
systemctl restart nginx &>>$LOG && systemctl start nginx &>>$LOG  && systemctl status nginx &>>$LOG
Stat $?

Head "Starting NPM"
npm start
Stat $?