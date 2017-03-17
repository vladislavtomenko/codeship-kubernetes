#!/bin/bash

set -e

# authenticate to google cloud
codeship_google authenticate

# set compute zone
gcloud config set compute/zone us-central1-a

# set kubernetes cluster	
gcloud container clusters get-credentials cluster-1
 
# update kubernetes Deployment
GOOGLE_APPLICATION_CREDENTIALS=/keyconfig.json kubectl set image deployment/backend backend=gcr.io/annular-ocean-161311/backend:$CI_TIMESTAMP
