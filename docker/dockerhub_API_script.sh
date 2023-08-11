#!/bin/bash
# Script will delete all images in all repositories of your docker hub account which are older than 50 days using DOCKER API
# Uses curl and jq
# Refer - https://serverfault.com/questions/1021883/how-to-delete-docker-images-older-than-x-days-from-docker-hub-using-a-shell-scri

DOCKER_LOGIN="my_docker_hub_user_id"
DOCKER_PASSWD="my_docker_hub_passwd"

echo "Logging in to Docker Hub account using ${DOCKER_LOGIN} ..."
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${DOCKER_LOGIN}'", "password": "'${DOCKER_PASSWD}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)
#echo $TOKEN
# get list of namespaces accessible by user (not in use right now)
#NAMESPACES=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/namespaces/ | jq -r '.namespaces|.[]')

# get list of repos for that user account
echo; echo "List of Repositories in ${DOCKER_LOGIN} Docker Hub account"
REPO_LIST=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKER_LOGIN}/?page_size=10000 | jq -r '.results|.[]|.name')
echo $REPO_LIST

# build a list of all images & tags
for i in ${REPO_LIST}
do
  # get tags for repo
  IMAGE_TAGS=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKER_LOGIN}/${i}/tags/?page_size=10000 | jq -r '.results|.[]|.name')

  # loop through the tags
  for j in ${IMAGE_TAGS}
  do
    # add each tag to list
    FULL_IMAGE_LIST="${FULL_IMAGE_LIST} ${DOCKER_LOGIN}/${i}:${j}"
  done
done
# now, output that list 
echo; echo "List of all docker images in ${DOCKER_LOGIN} Docker Hub account"
for i in ${FULL_IMAGE_LIST}
do
  echo ${i}
done

echo; echo "sleeping for 10 seconds ... kill it here if we dont want to delete ..."
sleep 10
echo "Identifying and deleting images which are older than 50 days in ${DOCKER_LOGIN} docker hub account"
for REPO in ${REPO_LIST}
#NOTE!!! For deleting Specific repositories images please include only those repositories in for loop  like below for loop which has repos mygninx and mykibana 
#eg for REPO in mynginx mykibana 
do
  # get tags for repo
  echo
  echo "Looping Through $REPO repository in ${DOCKER_LOGIN} account"
  IMAGE_TAGS=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKER_LOGIN}/${REPO}/tags/?page_size=10000 | jq -r '.results|.[]|.name')

  # build a list of images from tags
  for TAG in ${IMAGE_TAGS}
  do
    # add last_updated_time
    updated_time=$(curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKER_LOGIN}/${REPO}/tags/${TAG}/?page_size=10000 | jq -r '.last_updated')
    echo "${DOCKER_LOGIN}/${REPO}:${TAG}       $updated_time"
    datetime=$updated_time
    timeago='50 days ago'

    dtSec=$(date --date "$datetime" +'%s')
    taSec=$(date --date "$timeago" +'%s')
    #echo "INFO: dtSec=$dtSec, taSec=$taSec" 

    if [ $dtSec -lt $taSec ] 
    then
      echo "This image is older than 50 days, deleting this image ..."
      #### Please uncomment below line to delete docker hub images of docker hub repositories ####
      #curl -s  -X DELETE  -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKER_LOGIN}/${REPO}/tags/${TAG}/
    else
      echo "Skipping ..."
    fi      
  done
done

