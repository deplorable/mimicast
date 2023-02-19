FROM mimicast-base:1.0.0

# install utils
RUN apt-get install -y nano procps

# setup dbus, needed by pulseaudio
RUN mkdir /run/dbus
ENV DBUS_SESSION_BUS_ADDRESS="unix:path=/run/dbus/system_bus_socket"

COPY entrypoint.sh /

# install iproute2, so we can check our ip address details
RUN apt-get install -y iproute2

#add the mimic user with a home directory at /home/mimic
RUN useradd mimic -m

#add the mimic user to the audio group
RUN usermod -a -G audio mimic
RUN usermod -a -G pulse-access mimic

#add the root user to the audio group
RUN usermod -a -G audio root
RUN usermod -a -G pulse-access root

# update default configuration in /etc/pulse/default.pa
RUN echo '\n# configure pulse for use with snapcast' >> /etc/pulse/default.pa
RUN echo 'load-module module-suspend-on-idle' >> /etc/pulse/default.pa
RUN echo 'load-module module-pipe-sink file=/tmp/snapfifo sink_name=snapcast format=s16le rate=48000' >> /etc/pulse/default.pa
RUN echo "load-module module-null-sink sink_name=rtp format=s16be channels=2 rate=44100 sink_properties=\"device.description='RTP Multicast Sink'\"" >> /etc/pulse/default.pa
RUN echo 'load-module module-rtp-send source=rtp.monitor' >> /etc/pulse/default.pa
RUN echo 'update-sink-proplist snapcast device.description=Snapcast' >> /etc/pulse/default.pa
RUN echo 'set-default-sink-snapcast\n' >> /etc/pulse/default.pa
RUN cat /etc/pulse/default.pa

# run container indefinitely
ENTRYPOINT ["/entrypoint.sh"]
