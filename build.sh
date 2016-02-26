#!/bin/bash

# So kann man das machen
cd 5.2 &&
docker build --tag teamentropy/rewe-sonarqube .

# Anschliessend das neuste image taggen und pushen. Ca so:
#docker tag <hash> teamentropy/sonarqube
#docker push teamentropy/sonarqube
