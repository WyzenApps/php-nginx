#!/bin/bash

if [ $# -lt 1 ]; then
	echo "$0 <RELEASE_DIRNAME> [TAG]"
	exit 1
fi

RELEASE_DIR=$1

if [ ! -d ${RELEASE_DIR} ]; then
	echo "Directory not found : ${RELEASE_DIR}"
	exit 1
fi

DOCKERFILE_BUILD=Dockerfile.build

# Chargement de la conf
. ${RELEASE_DIR}/config.docker

FINAL_TAG=${2:-"$TAG"}
echo $RELEASE_DIR : $TAG : $FINAL_TAG

sed "s/#FROM_PHP#/${DOCKERFILE_FROM_PHP}/g; s/#PHP_RELEASE#/${DOCKERFILE_PHP_RELEASE}/g" Dockerfile.template >${DOCKERFILE_BUILD}

docker build --rm --no-cache -f ${DOCKERFILE_BUILD} --tag "${VENDOR}/${IMAGE}:${FINAL_TAG}" .

if [ $? -eq 0 ]; then
	rm ${DOCKERFILE_BUILD}
fi
exit $?
