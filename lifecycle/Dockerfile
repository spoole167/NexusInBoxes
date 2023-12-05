FROM ubuntu:latest as build
RUN apt-get update
RUN apt-get install -y wget
RUN mkdir install
WORKDIR install
RUN wget https://download.sonatype.com/clm/server/latest.tar.gz
RUN tar -xvf latest.tar.gz

RUN mv nexus-iq-server-*.jar   nexus-iq-server.jar


RUN wget -O jre.tar.gz https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u392-b08/OpenJDK8U-jre_x64_linux_hotspot_8u392b08.tar.gz
RUN tar -xvf jre.tar.gz
RUN mv jdk*  jre

FROM ubuntu:latest as runner
RUN mkdir server
WORKDIR server

EXPOSE 8070
EXPOSE 8071


RUN mkdir jre iq

COPY --from=build /install/jre ./jre

COPY --from=build /install/nexus-iq-server.jar ./iq
COPY config.yml ./iq

RUN jre/bin/java -version

ENV PATH=/server/jre/bin:$PATH

CMD ["java" ,"-jar", "iq/nexus-iq-server.jar", "server", "./iq/config.yml"]




