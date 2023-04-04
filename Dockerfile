FROM sonarqube:9.9-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER 999