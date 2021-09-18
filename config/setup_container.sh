#!/bin/bash
mkdir ~/logs 2>/dev/null
logfile=~/logs/setup_container.log

run_container=$1
  if ! [ "$run_container" ]
then exit 0
fi

db_version=$2
container_name=$3
docker_tns_port=$4
oracle_sid=$5
oracle_pdb=$6
database_password=$7
oradata_dir=$8

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
