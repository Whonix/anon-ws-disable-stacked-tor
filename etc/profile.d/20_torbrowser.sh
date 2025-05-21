#!/bin/sh

## Copyright (C) 2012 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

#### meta start
#### project Whonix
#### category networking
#### workstation_only yes
#### description
## <code>/etc/profile.d</code> hook to <code>source</code>
## <code>/usr/libexec/anon-ws-disable-stacked-tor/torbrowser.sh</code>
#### meta end

if [ -x /usr/libexec/anon-ws-disable-stacked-tor/torbrowser.sh ]; then
   . /usr/libexec/anon-ws-disable-stacked-tor/torbrowser.sh || true >/dev/null 2>/dev/null
fi
