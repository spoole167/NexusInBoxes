FROM ubuntu:latest as build
RUN apt-get update
RUN apt-get install -y wget

RUN mkdir install
WORKDIR install

RUN wget -O latest.tar.gz https://download.sonatype.com/nexus/3/nexus-3.62.0-01-unix.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv nexus*  nexus

RUN wget -O jre.tar.gz https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u392-b08/OpenJDK8U-jre_x64_linux_hotspot_8u392b08.tar.gz
RUN tar -xvf jre.tar.gz
RUN mv jdk*  jre

FROM ubuntu:latest as runner

RUN mkdir server jre
COPY --from=build /install/jre ./jre

WORKDIR /server

EXPOSE 8081

COPY --from=build /install/nexus ./nexus
COPY --from=build /install/sonatype-work ./sonatype-work
COPY launcher.sh /server/launcher.sh

ENV PATH=/jre/bin:$PATH
ENV JAVA_TOOL_OPTIONS="-Dnexus.licenseFile=/run/secrets/nexus -Dnexus.datastore.enabled=true -Dnexus.security.randompassword=false"

ENTRYPOINT /server/launcher.sh

