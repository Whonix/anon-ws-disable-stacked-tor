#!/bin/bash

## Copyright (C) 2012 - 2025 ENCRYPTED SUPPORT LLC <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

#### meta start
#### project Whonix
#### category networking and apps
#### workstation_only yes
#### description
## Environment variables for Tor Browser integration.
##
## Prevents Tor over Tor.

## Deactivate tor-launcher,
## a Vidalia replacement as browser extension,
## to prevent running Tor over Tor.
## https://gitlab.torproject.org/tpo/applications/tor-launcher/-/issues/6009
## https://gitlab.torproject.org/tpo/applications/tor-launcher.git
export TOR_SKIP_LAUNCH=1

## tor-launcher is deactivated above but the following is required to avoid
## "Firefox is offline" messages in Tor Browser 10.5a17 and above.
## https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/27476
## https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/40455
## https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/40433
## https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/34345
export TOR_USE_LEGACY_LAUNCHER=1

## The following TOR_SOCKS_HOST and TOR_SOCKS_PORT variables
## do not work flawlessly, due to an upstream bug in Tor Button:
##    "TOR_SOCKS_HOST, TOR_SOCKS_PORT regression"
##    https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/8336
## (As an alternative,
##    /home/user/tor-browser/Browser/TorBrowser/Data/Browser/profile.default/user.js
## could be used.)
## Fortunately, this is not required for Whonix by default anymore,
## because systemd-socket-proxyd is configured to redirect
## Whonix-Workstation ports
## IP HARDCODED but no need to change since comment only.
## 127.0.0.1:9050 to Whonix-Gateway 10.152.152.10:9050
## 127.0.0.1:9051 to Whonix-Gateway 10.152.152.10:9051
## 127.0.0.1:9150 to Whonix-Gateway 10.152.152.10:9150
## 127.0.0.1:9151 to Whonix-Gateway 10.152.152.10:9151
#export TOR_SOCKS_HOST="10.152.152.10"
#export TOR_SOCKS_PORT="9150"
#export TOR_CONTROL_HOST="127.0.0.1"
#export TOR_CONTROL_PORT="9151"
## this is to satisfy Tor Button just filled up with anything
#export TOR_CONTROL_PASSWD='"password"'

## We are not using TOR_TRANSPROXY=1 because that would break Tor Browser's
## per tab stream isolation. (Tor Browser talks to a Tor SocksPort and sets a
## socks user name and Tor is using IsolateSOCKSAuth by Tor default.)
#export TOR_TRANSPROXY=1

## Environment variable to configure Tor Browser to use a pre existing unix
## domain socket file instead of creating its own one to avoid Tor over Tor and
## to keep it being able to connect.
## systemd-socket-proxyd is being used for creation of unix domain socket file
## /run/anon-ws-disable-stacked-tor/127.0.0.1_9150.sock and forwarding it to
## to Whonix-Gateway port 9150.
## https://phabricator.whonix.org/T192
## https://trac.torproject.org/projects/tor/ticket/20111#comment:5
## TODO: IPv6 - Networking and IPv6 might not be available when this runs.
## TODO: IPv6 - Needs testing.
# if [[ "$(ip -o addr show scope global | awk '{print $3}')" =~ inet6 ]]; then
#   export TOR_SOCKS_IPC_PATH="/run/anon-ws-disable-stacked-tor/::1_9150.sock"
#   export TOR_CONTROL_IPC_PATH="/run/anon-ws-disable-stacked-tor/::1_9151.sock"
# else
#   export TOR_SOCKS_IPC_PATH="/run/anon-ws-disable-stacked-tor/127.0.0.1_9150.sock"
#   export TOR_CONTROL_IPC_PATH="/run/anon-ws-disable-stacked-tor/127.0.0.1_9151.sock"
# fi
## Using simpler, known stable implementation.
## TODO: Remove this if implementing the above.
export TOR_SOCKS_IPC_PATH="/run/anon-ws-disable-stacked-tor/127.0.0.1_9150.sock"
export TOR_CONTROL_IPC_PATH="/run/anon-ws-disable-stacked-tor/127.0.0.1_9151.sock"

## environment variable to skip TorButton control port verification
## https://trac.torproject.org/projects/tor/ticket/13079
export TOR_SKIP_CONTROLPORTTEST=1

## Environment variable to disable the "TorButton" ->
## "Open Network Settings..." menu item. It is not useful and confusing to have
## on a workstation, because Tor must be configured on the Whonix-Gateway, which is
## for security reasons forbidden from the Whonix-Gateway.
## https://trac.torproject.org/projects/tor/ticket/14100
## https://www.whonix.org/wiki/Tor_Browser/Advanced_Users#Open_Network_Settings
export TOR_NO_DISPLAY_NETWORK_SETTINGS=1

#### meta end
