#!/bin/bash

set -e

ls -lha
env

# authenticate to google cloud
codeship_google --help
codeship_google authenticate --help
codeship_google authenticate

# set compute zone
gcloud config set compute/zone us-central1-a

# set kubernetes cluster	
gcloud container clusters get-credentials cluster-1

# update kubernetes Deployment
GOOGLE_APPLICATION_CREDENTIALS=/keyconfig.json kubectl set image deployment/deployment-name app=gcr.io/project-name/app-name:$CI_TIMESTAMP
