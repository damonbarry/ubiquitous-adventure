#!/bin/bash
set -euo pipefail

# create the task (base image update trigger is enabled by default)
az acr task create \
    --name target \
    --registry $ACR_NAME \
    --image target \
    --context https://github.com/damonbarry/ubiquitous-adventure.git \
    --file images/target/Dockerfile \
    --commit-trigger-enabled false

# run the task once so ACR will start monitoring the base image for updates
az acr task run --name target --registry $ACR_NAME
