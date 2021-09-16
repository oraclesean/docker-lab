#!/bin/bash
mkdir ~/logs
logfile=~/logs/setup_image.log

image_source=$1
db_version=$2
docker_repo_name=$3
docker_repo_path=$4
image_url=$5
image_id=$6

printf "\nBegin setup_image.sh at %s\n" "$(date)" | tee -a $logfile

case "$db_version" in
  "19.3.0" ) dbsw_filename="LINUX.X64_193000_db_home.zip"
             image_tag="oracle/database:19.3.0-ee"
             ;;
  "21.3.0" ) dbsw_filename="LINUX.X64_213000_db_home.zip"
             image_tag="oracle/database:21.3.0-ee"
             ;;
esac

case "$image_source" in
  "Build")    curl -X GET ${dbsw_url}/${dbsw_filename} -o ~/${docker_repo_name}/${docker_repo_path}/${db_version}/${dbsw_filename} | tee -a  $logfile
              cd ~/${docker_repo_name}/${docker_repo_path}
              ./buildContainerImage.sh -v ${db_version} -e | tee -a $logfile
              ;;
#  "Registry" )
#              ;;
  *)
              curl -X GET ${image_url}/${image_id}.tar -o ~/${image_id}.tar | tee -a $logfile
              docker load -i ~/${image_id}.tar | tee -a $logfile
              docker tag ${image_id} ${image_tag} | tee -a $logfile
              rm ~/${image_id}.tar
              ;;
esac

printf "\nEnd setup_image.sh at %s\n" "$(date)" | tee -a $logfile
