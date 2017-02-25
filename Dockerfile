FROM scratch

ADD ubuntu-base-16.04-core-armhf.tar.gz /
ADD qemu-arm-static.tar.gz /
#ADD linux-image.deb /
#ADD rtl8723ds-mp-driver-common.deb /
#ADD rtl8723ds-mp-driver-modules.deb /
#ADD rtl8723bs-mp-driver-common.deb /
#ADD rtl8723bs-mp-driver-modules.deb /
#RUN dpkg -i /*.deb && rm /*.deb

RUN apt-get -y update && apt-get -y install kmod wget
RUN wget -O - http://ntc-stable-mlc-4_4_y.surge.sh/public.key | apt-key add -
RUN echo "deb http://ntc-stable-mlc-4_4_y.surge.sh/ stable main" >/etc/apt/sources.list.d/ntc-stable-mlc.list
RUN apt-get -y update && apt-get -y install --no-install-recommends linux-image-4.4.51-ntc rtl8723ds-mp-driver-modules-4.4.51-ntc rtl8723bs-mp-driver-modules-4.4.51-ntc
