#!/bin/sh

## Copyright (C) 2012 - 2021 ENCRYPTED SUPPORT LP <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

#### meta start
#### project Whonix
#### category networking
#### workstation_only yes
#### description
## <code>/etc/profile.d</code> hook to <code>source</code>
## <code>/usr/lib/anon-ws-disable-stacked-tor/torbrowser.sh</code>
#### meta end

if [ -x /usr/lib/anon-ws-disable-stacked-tor/torbrowser.sh ]; then
   . /usr/lib/anon-ws-disable-stacked-tor/torbrowser.sh
fi
