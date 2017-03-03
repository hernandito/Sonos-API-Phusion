# use 12.04 precise (https://github.com/docker/docker/issues/5899)
FROM phusion/baseimage:0.9.9
MAINTAINER Justin Ellison <justin@techadvise.com>

# Set correct environment variables.
ENV DEBIAN_FRONTEND noninteractive
# Set correct environment variables
ENV HOME /root

ADD . /build

RUN chmod +x /build/prepare.sh
RUN chmod +x /build/install.sh
RUN chmod +x /build/cleanup.sh

RUN /build/prepare.sh && \
	/build/install.sh && \
	/build/cleanup.sh

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

EXPOSE 5005
#VOLUME /app
ENV TERM=xterm

ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
