#!/bin/sh
nm-applet --sm-disable &
dropbox start -i &
bluetooth-applet &
/usr/bin/gnome-keyring-daemon --start --components=pkcs11 &
sh -c 'test -e /var/cache/jockey/check || exec jockey-gtk --check' &
/usr/lib/gnome-disk-utility/gdu-notification-daemon &
gtk-redshift &

exec xmonad
