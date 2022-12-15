#!/bin/bash

if [ $# -ne 1 ]; then
	echo "$0 <RELEASE_DIRNAME>"
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

sed "s/#FROM_PHP#/${DOCKERFILE_FROM_PHP}/g; s/#PHP_RELEASE#/${DOCKERFILE_PHP_RELEASE}/g" Dockerfile.template >${DOCKERFILE_BUILD}

docker build --rm -f ${DOCKERFILE_BUILD} --tag "${VENDOR}/${IMAGE}:${TAG}" .

if [ $? -eq 0 ]; then
	rm ${DOCKERFILE_BUILD}
fi
exit $?
