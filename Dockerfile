# syntax=docker/dockerfile:1

FROM openjdk:11.0.16-jdk-buster

LABEL version="1.13.3"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Integration by Parts DX"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/0f/0fda3c68ef6ee050b28ec133824c19620464deb49c4a3bc0cbcbce4ccb1e4479.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTBIntegrationbyPartsDX:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Integration by Parts DX v1.13.3 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]