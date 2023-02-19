#!/bin/sh

/usr/bin/snapserver &

if ! pgrep -x "dbus-daemon" > /dev/null
then
  dbus-daemon --config-file=/usr/share/dbus-1/system.conf &
else
  echo "dbus-daemon already running"
fi

pulseaudio --daemonize=no --system --realtime --log-target=journal &

tail -f /dev/null
