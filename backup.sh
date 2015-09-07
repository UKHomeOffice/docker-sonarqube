#!/usr/bin/env bash

if [[ -n ${SONAR_QUBE_BACKUP_S3_BUCKET_NAME} ]]; then
  cd "$SONARQUBE_HOME" || exit 99
  tar --exclude 'temp/*' \
      --exclude 'bin/*' \
      --exclude 'web/*' \
      --exclude 'lib/*' \
      --exclude 'data/*' \
      -czf /tmp/sonar_qube_extensions.tar.gz .

  if [[ -f /tmp/sonar_qube_extensions.tar.gz ]]; then
    aws s3 cp /tmp/sonar_qube_extensions.tar.gz "s3://${SONAR_QUBE_BACKUP_S3_BUCKET_NAME}/"
    rm /tmp/sonar_qube_extensions.tar.gz
  fi
else
  echo 'Unable to backup existing sonar qube configuration. SONAR_QUBE_BACKUP_S3_BUCKET_NAME is unset.'
fi
