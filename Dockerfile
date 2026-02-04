FROM sonarqube:26.1.0.118079-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER 999
