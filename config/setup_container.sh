#!/bin/bash
mkdir ~/logs >/dev/null
logfile=~/logs/setup_container.log

db_version=$1
container_name=$2
docker_tns_port=$3
oracle_sid=$4
oracle_pdb=$5
database_password=$6
oradata_dir=$7

printf "\nBegin setup_container.sh at %s\n" "$(date)" | tee -a $logfile

case "$db_version" in
  "19.3.0" ) image_tag="oracle/database:19.3.0-ee" ;;
  "21.3.0" ) image_tag="oracle/database:21.3.0-ee" ;;
esac

docker run --name ${container_name} \
           -p ${docker_tns_port}:1521 \
           -e ORACLE_SID=${oracle_sid} \
           -e ORACLE_PDB=${oracle_pdb} \
           -e ORACLE_PWD=${database_password} \
           -v ${oradata_dir}:/opt/oracle/oradata \
           ${image_tag} | tee -a $logfile

printf "\nEnd setup_container.sh at %s\n" "$(date)" | tee -a $logfile
