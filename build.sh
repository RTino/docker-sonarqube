#!/bin/bash

# So hab ich das einfach immer gemacht
cd 5.2 &&
docker build --tag rtino/rewe-sonarqube .

# Anschliessend das neuste image taggen und pushen. Ca so:
#docker tag -f <hash> rtino/rewe-sonarqube
#docker push rtino/rewe-sonarqube
