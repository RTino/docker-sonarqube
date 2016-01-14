#!/bin/bash
set -e

echo "sonar.security.realm=Crowd" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "sonar.security.localUsers=admin" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "sonar.authenticator.downcase=true" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "sonar.security.updateUserAttributes=true" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "sonar.authenticator.class: org.sonar.plugins.crowd.CrowdAuthenticator" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "crowd.url: ${SONARQUBE_CROWD_URL}" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "crowd.application: ${SONARQUBE_CROWD_APPLICATION}" >> "${SONARQUBE_HOME}/conf/sonar.properties"
echo "crowd.password: $SONARQUBE_CROWD_PASSWORD" >> "${SONARQUBE_HOME}/conf/sonar.properties"

exec java -jar "lib/sonar-application-$SONAR_VERSION.jar" \
		  -Dsonar.log.console=true \
		  -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" \
		  -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" \
		  -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" \
		  -Dsonar.web.javaAdditionalOpts="-Djava.security.egd=file:/dev/./urandom" \
		  -Dsonar.jdbc.maxActive=20 \
		  -Dsonar.jdbc.maxIdle=5 \
		  -Dsonar.jdbc.minIdle=2 \
		  -Dsonar.jdbc.maxWait=5000 \
		  -Dsonar.jdbc.minEvictableIdleTimeMillis=600000 \
		  -Dsonar.jdbc.timeBetweenEvictionRunsMillis=30000 \
		  -Dsonar.web.host='0.0.0.0' \
		  -Dsonar.web.port=9000 \
		  -Dsonar.security.realm=Crowd \
		  -Dsonar.security.localUsers='admin' \
		  -Dsonar.authenticator.downcase=true \
		  -Dsonar.security.updateUserAttributes=true \
		  -Dsonar.security.realm.ignoreStartupFailure=true \
		  -Dsonar.security.realm.createUsers=true \
