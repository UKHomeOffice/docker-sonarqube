#!/bin/bash
set -e

# Ensure that the plugins directories are created if we're mounting a fresh volume
mkdir -p extensions/jdbc-driver/oracle/ \
         extensions/deprecated \
         extensions/plugins

SONAR_ARGS='-Dsonar.web.javaOpts=-server -Dsonar.log.console=true'

if [ ! -z "$SONARQUBE_JDBC_PASSWORD_PATH" ]; then
  SONARQUBE_JDBC_PASSWORD="$(cat "$SONARQUBE_JDBC_PASSWORD_PATH")"
  export SONARQUBE_JDBC_PASSWORD
fi

if [ ! -z "$SONARQUBE_JDBC_USERNAME" ]; then
  SONAR_ARGS="${SONAR_ARGS} -Dsonar.jdbc.username=$SONARQUBE_JDBC_USERNAME"
fi

if [ ! -z "$SONARQUBE_JDBC_PASSWORD" ]; then
  SONAR_ARGS="${SONAR_ARGS} -Dsonar.jdbc.password=$SONARQUBE_JDBC_PASSWORD"
fi

if [ ! -z "$SONARQUBE_JDBC_URL" ]; then
  SONAR_ARGS="${SONAR_ARGS} -Dsonar.jdbc.url=$SONARQUBE_JDBC_URL"
fi

if [[ "${SONARQUBE_JDBC_URL}" != *"mysql"* ]]; then
  SONAR_ARGS="${SONAR_ARGS} -Dsonar.embeddedDatabase.port=9092"
fi

if [ "${1:0:1}" != '-' ]; then
  exec "$@"
fi

echo "Running sonar with the following args: ${SONAR_ARGS}"
EXITCODE=0

java -jar "lib/sonar-application-$SONAR_VERSION.jar" -Dsonar.web.javaAdditionalOpts="-Djava.security.egd=file:/dev/./urandom" ${SONAR_ARGS} "$@"

exit ${EXITCODE}
