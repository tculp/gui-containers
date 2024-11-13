FROM ubuntu:noble

ARG S6_VER="3.2.0.2"
ARG NO_VNC_VER="1.5.0"
ARG ARCH="x86_64"


## S6
RUN apt update && apt install -y xz-utils
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-noarch.tar.xz /tmp
RUN ls /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-${ARCH}.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]


## KDE
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y plasma-desktop
RUN apt install -y dbus-x11 dolphin konsole


## TigerVNC
RUN apt install -y tigervnc-standalone-server tigervnc-xorg-extension
ENV DISPLAY=:0 \
    SCR_WIDTH=1600 \
    SCR_HEIGHT=900
EXPOSE 5900


## NOVNC
ADD https://github.com/novnc/noVNC/archive/v${NO_VNC_VER}.zip /tmp
RUN cd /tmp && \
    apt install -y unzip python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    unzip v${NO_VNC_VER}.zip && \
    mv noVNC-${NO_VNC_VER} /novnc
EXPOSE 8080


## USER
RUN useradd -U -u 1001 user && \
    usermod -G users -s /bin/bash user && \
    usermod -G sudo user
WORKDIR /home/user


## All Dependencies Satisfied
COPY _root /


# Cleanup
RUN apt autoremove -y && \
    apt clean
