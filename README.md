# Prevents Tor over Tor in Anonymity Distribution Workstations #

Supposed to be installed on Workstations, which prevents installing the real
Tor package from upstream (ex: Debian, The Tor Project) APT repositories. Its
purpose is to prevent, running Tor over Tor.

It allows installation of packages, which depend on Tor, such as TorChat,
parcimonie and torbrowser-launcher.

This package uses the "Provides: tor" field[1], which should avoid any kinds of
conflicts, in case upstream releases a higher version of Tor. This won't work
for packages, which depend on an explicit version of Tor (such as TorChat).
This is non-ideal, since for example the torchat package will install Tor, but
still acceptable, because of the following additional implementations.

Binaries eventually installed (by the tor Debian package) /usr/bin/tor as well
as /usr/sbin/tor are replaced with a dummy wrapper that does nothing
(dpkg-diverted using config-package-dev).

systemd-socket-proxyd listens on Tor's default ports. system Tor's
127.0.0.1:9050, 127.0.0.1:9051 and TBB's 127.0.0.1:9150, 127.0.0.1:9051,
which prevents the
default Tor Browser Bundle or Tor package by The Tor Project from opening
these default ports, which will result in Tor failing to open its listening
port and therefore exiting, thus preventing Tor over Tor.

See also:

* https://www.whonix.org/wiki/Dev/anon-ws-disable-stacked-tor
* https://tor.stackexchange.com/questions/427/is-running-tor-over-tor-dangerous

[1] See "7.5 Virtual packages - Provides" on
https://www.debian.org/doc/debian-policy/ch-relationships.html

This package is produced independently of, and carries no guarantee from,
The Tor Project.

## How to install `anon-ws-disable-stacked-tor` using apt-get ##

1\. Download the APT Signing Key.

```
wget https://www.whonix.org/keys/derivative.asc
```

Users can [check the Signing Key](https://www.whonix.org/wiki/Signing_Key) for better security.

2\. Add the APT Signing Key.

```
sudo cp ~/derivative.asc /usr/share/keyrings/derivative.asc
```

3\. Add the derivative repository.

```
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] https://deb.whonix.org trixie main contrib non-free" | sudo tee /etc/apt/sources.list.d/derivative.list
```

4\. Update your package lists.

```
sudo apt-get update
```

5\. Install `anon-ws-disable-stacked-tor`.

```
sudo apt-get install anon-ws-disable-stacked-tor
```

## How to Build deb Package from Source Code ##

Can be build using standard Debian package build tools such as:

```
dpkg-buildpackage -b
```

See instructions.

NOTE: Replace `generic-package` with the actual name of this package `anon-ws-disable-stacked-tor`.

* **A)** [easy](https://www.whonix.org/wiki/Dev/Build_Documentation/generic-package/easy), _OR_
* **B)** [including verifying software signatures](https://www.whonix.org/wiki/Dev/Build_Documentation/generic-package)

## Contact ##

* [Free Forum Support](https://forums.whonix.org)
* [Premium Support](https://www.whonix.org/wiki/Premium_Support)

## Donate ##

`anon-ws-disable-stacked-tor` requires [donations](https://www.whonix.org/wiki/Donate) to stay alive!
