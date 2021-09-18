#!/bin/bash
mkdir ~/logs 2>/dev/null
logfile=~/logs/setup_repo.log

printf "\nBegin setup_repo.sh at %s\n" "$(date)" | tee -a $logfile

git clone https://github.com/oracle/docker-images ~/docker-images | tee -a $logfile
mkdir ~/alpine | tee -a $logfile
curl -g https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86_64/alpine-minirootfs-3.14.0-x86_64.tar.gz -o ~/alpine/alpine-minirootfs-3.14.0-x86_64.tar.gz | tee -a $logfile
tar -xzf ~/alpine/alpine-minirootfs-3.14.0-x86_64.tar.gz -C ~/alpine | tee -a $logfile
rm ~/alpine/alpine-minirootfs-3.14.0-x86_64.tar.gz | tee -a $logfile

printf "\nEnd setup_repo.sh at %s\n" "$(date)" | tee -a $logfile
