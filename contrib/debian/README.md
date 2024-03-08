
Debian
====================
This directory contains files used to package aittcoind/aittcoin-qt
for Debian-based Linux systems. If you compile aittcoind/aittcoin-qt yourself, there are some useful files here.

## aittcoin: URI support ##


aittcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install aittcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your aittcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/aittcoin128.png` to `/usr/share/pixmaps`

aittcoin-qt.protocol (KDE)

