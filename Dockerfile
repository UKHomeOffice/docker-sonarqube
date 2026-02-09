FROM sonarqube:26.1.0.118079-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER root

COPY sonar-auth-oidc-plugin-3.0.0.jar /opt/sonarqube/extensions/plugins/

USER 999
