#!/bin/bash

for item in pen pencil etc ; do
    echo item name= $item
    sleep 1
  done  




i=100

while [$i -gt 0];do
  echo value=$i
  i=$(($i-1))
  done
