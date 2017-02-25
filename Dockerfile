FROM scratch

ADD dl/ubuntu-base-16.04-core-armhf.tar.gz /
ADD qemu-arm-static.tar.gz /
ADD linux-image.deb /
ADD rtl8723ds-mp-driver-common.deb /
ADD rtl8723ds-mp-driver-modules.deb /
ADD rtl8723bs-mp-driver-common.deb /
ADD rtl8723bs-mp-driver-modules.deb /

RUN apt-get update && apt-get install kmod
RUN dpkg -i /*.deb && rm /*.deb
