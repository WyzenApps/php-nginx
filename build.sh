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

# Chargement de la conf
. ${RELEASE_DIR}/config.docker

docker build --rm -f Dockerfile --tag "${VENDOR}/${IMAGE}:${TAG}" .

exit $?
