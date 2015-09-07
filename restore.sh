#!/usr/bin/env bash

if [[ -n ${SONAR_QUBE_BACKUP_S3_BUCKET_NAME} ]]; then

  aws s3 cp "s3://${SONAR_QUBE_BACKUP_S3_BUCKET_NAME}/sonar_qube_extensions.tar.gz" \
            /tmp/sonar_qube_extensions.tar.gz

  if [[ -f /tmp/sonar_qube_extensions.tar.gz ]]; then
    cd "$SONARQUBE_HOME" || exit 99
    tar -xzf /tmp/sonar_qube_extensions.tar.gz
    rm -f /tmp/sonar_qube_extensions.tar.gz
  fi
else
  echo 'Unable to restore existing sonar qube configuration. SONAR_QUBE_BACKUP_S3_BUCKET_NAME is unset.'
fi
