#!/bin/bash
mkdir ~/logs 2>/dev/null
logfile=~/logs/setup_image.log

image_source=$1
db_version=$2
container_registry_pass=$3
container_registry_user=$4

printf "\nBegin setup_image.sh at %s\n" "$(date)" | tee -a $logfile

case "$db_version" in
  "19.3.0" ) dbsw_filename="LINUX.X64_193000_db_home.zip"
             image_tag="oracle/database:19.3.0-ee"
             image_id="a91f6e77a0cd"
             image_par="https://objectstorage.us-phoenix-1.oraclecloud.com/p/6_jVyN-10oyKbnhcMBJifHbPaN-jIX60ZBDP2GzfDqBovP6GK02fctbMgVNLzS0D/n/axd5etgwus1g/b/docker-images/o"
             dbsw_par="https://objectstorage.us-phoenix-1.oraclecloud.com/p/snG72sirYDFDO_Db7U252SG-zqCWBdi5fF4Kqr8-RkrQ8atfsfWZqYeYDUkRtGX0/n/axd5etgwus1g/b/docker-images/o"
             ;;
  "21.3.0" ) dbsw_filename="LINUX.X64_213000_db_home.zip"
             image_tag="oracle/database:21.3.0-ee"
             image_id="7925b37d58fd"
             image_par="https://objectstorage.us-phoenix-1.oraclecloud.com/p/FlmIahdPJX_Ol4KVlOG9-lUFD-w0_vjzeFmpk9PYGPs_gAvbBN6hAMQQBLRqKJmQ/n/axd5etgwus1g/b/docker-images/o"
             dbsw_par="https://objectstorage.us-phoenix-1.oraclecloud.com/p/IbJN_WObtNJd2FekvejeuiKKHQBqp2ZvLe9Q3cbqmwx7tAbvpKydOxWKwZhQWrTd/n/axd5etgwus1g/b/docker-images/o"
             ;;
esac

case "$image_source" in
  "Build")     curl -X GET ${dbsw_par}/${dbsw_filename} -o ~/docker-images/OracleDatabase/SingleInstance/dockerfiles/${db_version}/${dbsw_filename} | tee -a  $logfile
               cd ~/docker-images/OracleDatabase/SingleInstance/dockerfiles
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
