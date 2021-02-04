FROM openjdk:8-slim-buster

RUN apt-get update \
    && apt-get install -y wget ca-certificates unzip

RUN mkdir -p /opt/controltest \
    && cd /tmp \
    && wget https://sci2s.ugr.es/sites/default/files/files/TematicWebSites/sicidm/controlTest.zip \
    && unzip -x controlTest.zip -d /opt/controltest \
    && cd /opt/controltest \
    && mkdir META-INF \
    && echo "Main-Class: Friedman" >> META-INF/MANIFEST.MF \
    && jar cmvf META-INF/MANIFEST.MF controltest.jar . \
    && mkdir -p /workspace \
    && rm -rf /tmp/*

WORKDIR "/workspace"
ENTRYPOINT ["java", "-jar", "/opt/controltest/controltest.jar"]
CMD ["/opt/controltest/data.csv"]
