FROM debian:stable-slim
RUN apt-get update
RUN apt-get install -y wget curl

# install pulse audio
RUN apt-get install -y pulseaudio 

# dependenceis for mimic3
RUN apt-get install -y libespeak-ng1 python3 python3-pip
RUN mkdir /mimic
RUN cd /mimic && wget https://github.com/MycroftAI/mimic3/releases/download/release%2Fv0.2.4/mycroft-mimic3-tts_0.2.4_amd64.deb && dpkg -i /mimic/mycroft-mimic3-tts_0.2.4_amd64.deb
RUN python3 -V

# install aplay binary
RUN apt-get install -y alsa-utils

# dependencies for snapcastserver
RUN apt-get install -y libavahi-common3 libavahi-client3 libsoxr0
# dependencies for snapcast client
RUN apt-get install -y libvorbisidec1

# download and install snapcast server and client
RUN mkdir /snapcast
RUN cd /snapcast && wget https://github.com/badaix/snapcast/releases/download/v0.27.0/snapserver_0.27.0-1_amd64.deb && dpkg -i /snapcast/snapserver_0.27.0-1_amd64.deb
RUN cd /snapcast && wget https://github.com/badaix/snapcast/releases/download/v0.27.0/snapclient_0.27.0-1_amd64.deb && dpkg -i /snapcast/snapclient_0.27.0-1_amd64.deb
RUN cd /snapcast && wget https://github.com/badaix/snapcast/archive/refs/tags/v0.27.0.zip
RUN cd /snapcast && wget https://github.com/badaix/snapcast/releases/download/v0.27.0/snapclient_0.27.0-1_without-pulse_amd64.deb 
RUN cd /snapcast && wget https://github.com/badaix/snapcast/releases/download/v0.27.0/snapclient_0.27.0-1_without-pulse_armhf.deb 
RUN cd /snapcast && wget https://github.com/badaix/snapcast/releases/download/v0.27.0/snapserver_0.27.0-1_armhf.deb
RUN cd /snapcast && wget https://github.com/badaix/snapcast/releases/download/v0.27.0/snapcast_win64.zip

# run container indefinitely
ENTRYPOINT ["tail", "-f", "/dev/null"]
