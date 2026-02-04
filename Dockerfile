FROM sonarqube:25.1.0.102122-community

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER 999
