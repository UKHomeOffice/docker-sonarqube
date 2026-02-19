FROM sonarqube:24.12.0.100206-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER root
RUN mkdir -p /opt/oidc-plugins
COPY plugins/ /opt/oidc-plugins/
USER 999
