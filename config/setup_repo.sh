#!/bin/bash
mkdir ~/logs
logfile=~/logs/repo_setup.log

docker_repo_source=$1
docker_repo_name=$2
alpine_source=$3
alpine_basename=$4

printf "\nBegin repo_setup.sh at %s\n" "$(date)"

git clone ${docker_repo_source} ~/${docker_repo_name} | tee -a $logfile
mkdir ~/alpine | tee -a $logfile
curl -g ${alpine_source}/${alpine_basename}.tar.gz -o ~/alpine/${alpine_basename}.tar.gz | tee -a $logfile
tar -xzf ~/alpine/${alpine_basename}.tar.gz | tee -a $logfile
rm ~/alpine/${alpine_basename}.tar.gz | tee -a $logfile

printf "\nEnd repo_setup.sh at %s\n" "$(date)"
