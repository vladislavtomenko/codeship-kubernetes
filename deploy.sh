#!/bin/bash

set -e

# authenticate to google cloud
echo $GOOGLE_AUTH_JSON> key.json
gcloud auth activate-service-account --key-file=key.json
#codeship_google authenticate

# set compute zone
gcloud config set compute/zone us-central1-a

# set kubernetes cluster	
gcloud container clusters get-credentials cluster-1

# update kubernetes Deployment
GOOGLE_APPLICATION_CREDENTIALS=/keyconfig.json kubectl set image deployment/deployment-name app=gcr.io/project-name/app-name:$CI_TIMESTAMP
