FROM quay.io/ukhomeofficedigital/openjdk8:latest

RUN yum clean all && \
    yum update -y --exclude iputils* && \
    yum install -y curl unzip sudo && \
    yum clean all && \
    rpm --rebuilddb

RUN echo "sonarqube ALL=NOPASSWD: ALL" >> /etc/sudoers

ENV SONAR_VERSION=6.7.1 \
    SONARQUBE_HOME=/opt/sonarqube \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL=jdbc:h2:tcp://localhost:9092/sonar

RUN groupadd -r sonarqube && \
    useradd -r -g sonarqube -u 1000 sonarqube -d ${SONARQUBE_HOME} && \
    mkdir -p ${SONARQUBE_HOME} && \
    chown -R sonarqube:sonarqube /opt

USER 1000

# Http port
EXPOSE 9000

RUN set -x \
    # pub   2048R/D26468DE 2015-05-25
    #       Key fingerprint = F118 2E81 C792 9289 21DB  CAB4 CFCA 4A29 D264 68DE
    # uid                  sonarsource_deployer (Sonarsource Deployer) <infra@sonarsource.com>
    # sub   2048R/06855C1D 2015-05-25
    #&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys F1182E81C792928921DBCAB4CFCA4A29D26468DE \
    && cd /opt \
    && curl -o sonarqube.zip -fSL https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip \
    && curl -o sonarqube.zip.asc -fSL https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip.asc \
    #&& gpg --batch --verify sonarqube.zip.asc sonarqube.zip \
    && unzip sonarqube.zip \
    && mv sonarqube-$SONAR_VERSION/* sonarqube/. \
    && rm sonarqube.zip* \
    && rm -rf $SONARQUBE_HOME/bin/*

VOLUME ["$SONARQUBE_HOME/extensions"]

WORKDIR $SONARQUBE_HOME
COPY *.sh $SONARQUBE_HOME/bin/
ENTRYPOINT ${SONARQUBE_HOME}/bin/run.sh
