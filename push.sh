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

docker system info | grep -qE 'Username'
if [ $? -eq 1 ]; then
	echo "Connexion docker hub required"
	docker login --username wyzengroup 2>/dev/null

	if [ $? -eq 1 ]; then
		echo "Erreur de connexion"
		exit 1
	fi
fi

docker push ${VENDOR}/${IMAGE}:${TAG}
