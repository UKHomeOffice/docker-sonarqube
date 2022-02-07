FROM sonarqube:8.9.6-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER 999
