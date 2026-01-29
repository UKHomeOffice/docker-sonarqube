FROM sonarqube:2025.1.5-enterprise

ENV sonar.search.javaAdditionalOpts="-Dlog4j2.formatMsgNoLookups=true"

USER 999
