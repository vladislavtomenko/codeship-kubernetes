#!/bin/bash

set -e

# authenticate to google cloud
codeship_google authenticate

# set compute zone
gcloud config set compute/zone us-central1-a

# set kubernetes cluster	
gcloud container clusters get-credentials cluster-1

# update kubernetes Deployment
echo $CI_TIMESTAM
GOOGLE_APPLICATION_CREDENTIALS=/keyconfig.json kubectl set image deployment/deployment-name deployment-name=gcr.io/annular-ocean-161311/app-name:$CI_TIMESTAMP
echo $GOOGLE_APPLICATION_CREDENTIALS
