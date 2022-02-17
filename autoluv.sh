#!/bin/bash

service atd start

autoluv $@

if [ "$1" == "schedule" ]
then
   while true
   do
      sleep 1m
   done
fi