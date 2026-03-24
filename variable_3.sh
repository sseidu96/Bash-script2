#!/bin/bash


    #Author : Safiatu Seidu
    #Date : 01-Nov-2025
    
## ---------- If statement allow you to check specific condition  -----------------

# -----  for install some softwares, we need root access ------------
if [ ${USER} != root ]   
    then 
    echo "You need root access to run this cmd"
    exit 1   ## imediatlly quit the script
fi

yum install wget -y 
yum install curl -y 
yum install zip -y 
yum install vim -y 
