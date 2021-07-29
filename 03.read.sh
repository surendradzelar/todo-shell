#!/bin/bash

read -p "enter name: ", name
read -p "enter age: ", age 

echo -e  "your name="\e[32m$name\e[0m", your age="\e[34m$age\e[0m"