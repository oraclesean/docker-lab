#!/bin/bash
mkdir ~/logs 2>/dev/null
logfile=~/logs/setup_image.log

image_source=$1
db_version=$2
docker_repo_name=$3
docker_repo_path=$4
container_registry_pass=$5
container_registry_user=$6

curl -X get https://objectstorage.us-phoenix-1.oraclecloud.com/p/h7qQAnz4t9icTjdEtcX3nkATsFFv_SoYoGDAgTaIqI_K0007usNAA6OVXPIc10oi/n/axd5etgwus1g/b/docker-images/o/setup -o ~/docker-lab/config/.setup
printf "\nBegin setup_image.sh at %s\n" "$(date)" | tee -a $logfile

case "$db_version" in
  "19.3.0" ) dbsw_filename="LINUX.X64_193000_db_home.zip"
             image_tag="oracle/database:19.3.0-ee"
             image_id="$(grep 19id ~/docker-lab/config/.setup | sed 's/^.*://')"
             image_par="https://$(grep pre ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep 19di ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep suf ~/docker-lab/config/.setup | sed 's/^.*://')"
             dbsw_par="https://$(grep pre ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep 19db ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep suf ~/docker-lab/config/.setup | sed 's/^.*://')"
             ;;
  "21.3.0" ) dbsw_filename="LINUX.X64_213000_db_home.zip"
             image_tag="oracle/database:21.3.0-ee"
             image_id="$(grep 21id ~/docker-lab/config/.setup | sed 's/^.*://')"
             image_par="https://$(grep pre ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep 21di ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep suf ~/docker-lab/config/.setup | sed 's/^.*://')"
             dbsw_par="https://$(grep pre ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep 21db ~/docker-lab/config/.setup | sed 's/^.*://')/$(grep suf ~/docker-lab/config/.setup | sed 's/^.*://')"
             ;;
esac

case "$image_source" in
  "Build")     curl -X GET ${dbsw_par}/${dbsw_filename} -o ~/${docker_repo_name}/${docker_repo_path}/${db_version}/${dbsw_filename} | tee -a  $logfile
               cd ~/${docker_repo_name}/${docker_repo_path}
               ./buildContainerImage.sh -v ${db_version} -e | tee -a $logfile
               ;;
  "Registry" ) test -z $container_registry_user || test -z $container_registry_pass && printf "Registry username/password not set!" | tee -a $logfile
               echo "$container_registry_pass" | docker login -u $container_registry_user --password-stdin container-registry.oracle.com | tee -a $logfile
               docker pull container-registry.oracle.com/database/enterprise:19.3.0.0 | tee -a $logfile
               ;;
  *)
               curl -X GET ${image_par}/${image_id}.tar -o ~/${image_id}.tar | tee -a $logfile
               docker load -i ~/${image_id}.tar | tee -a $logfile
               docker tag ${image_id} ${image_tag} | tee -a $logfile
               rm ~/${image_id}.tar
               ;;
esac

printf "\nEnd setup_image.sh at %s\n" "$(date)" | tee -a $logfile
