FROM sonarqube:26.1.0.118079-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER root
RUN mkdir -p /opt/oidc-plugins && \
    curl -L -o /opt/oidc-plugins/sonar-auth-oidc-plugin-3.0.0.jar \
    https://github.com/vaulttec/sonar-auth-oidc/releases/download/v3.0.0/sonar-auth-oidc-plugin-3.0.0.jar
USER 999
