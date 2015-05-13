#!/bin/bash

BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
GIT_STATUS=$(git status)
WDC_MSG="working directory clean"

if [ "${GIT_STATUS/$WDC_MSG}" = "$GIT_STATUS" ] ; then
	echo "FATAL: working directory not clean. Will not publish."
	exit 1
fi

jekyll build

if [ "$BRANCH" == "master" ]
then
  echo "Publishing to production (www.montadigital.com)"
  s3_website push
else
  echo "Publishing a preview build to preview.montadigital.com"
  s3_website push --config-dir preview-build-config 
fi
