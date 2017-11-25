# A debian based collection of openbox/tint2/conky themes

RELEASE=hydrogen
RELEASE=deuterium  # derived from Debian Jessie. 
RELEASE=helium     # derived from Debian Stretch
DEBIAN_FRONTEND=noninteractive 

apt-get install -y bunsen-keyring

#curl -s https://pkg.bunsenlabs.org/BunsenLabs-${RELEASE}.asc | \
#	gpg --with-fingerprint -  | \
#	apt-key add -

# hydrogen
#echo "deb http://pkg.bunsenlabs.org/debian bunsen-hydrogen main" > /etc/apt/sources.list-available/bunsen-hydrogen.list

#echo "deb http://pkg.bunsenlabs.org/debian jessie-backports main" > /etc/apt/sources.list-available/bunsen-jessie-backports.list

#ln -s /etc/apt/sources.list-available/bunsen-hydrogen.list /etc/apt/sources.list.d/bunsen-hydrogen.list

#ln -s /etc/apt/sources.list-available/bunsen-jessie-backports.list /etc/apt/sources.list.d/bunsen-jessie-backports.list

# helium
echo "deb http://pkg.bunsenlabs.org/debian bunsen-helium main" > /etc/apt/sources.list-available/bunsen-helium.list

echo "deb http://pkg.bunsenlabs.org/debian stretch-backports main" > /etc/apt/sources.list-available/bunsen-stretch-backports.list

echo "deb http://pkg.bunsenlabs.org/debian unstable main" > /etc/apt/sources.list-available/bunsen-other.list

ln -s /etc/apt/sources.list-available/bunsen-helium.list /etc/apt/sources.list.d/bunsen-helium.list

ln -s /etc/apt/sources.list-available/bunsen-stretch-backports.list /etc/apt/sources.list.d/bunsen-stretch-backports.list

ln -s /etc/apt/sources.list-available/bunsen-other.list /etc/apt/sources.list.d/bunsen-other.list

apt-get update

# These are the base packages for a bunsenized openbox system 
#apt-get install -y \
# 	bunsen-os-release \
# 	bunsen-thunar \
# 	bunsen-welcome \
#	bunsen-pipemenus \
#	bunsen-themes \
#	bunsen-common \
#	bunsen-docs \
#	bunsen-images \
#	bunsen-keyring \
#	bunsen-welcome \
#	bunsen-configs \
#	bunsen-python-apt-template \
#	bunsen-conky \
#	bunsen-faenza-icon-theme \
#	bunsen-meta-libreoffice \
#	bunsen-utilities \
#	tint2 \
#	geany \
#	openbox \
#	obconf \
#	obmenu \
#	thunar

# bunsen-meta-all pulls in more gnome/policykit/pulseaudio related deps
#Recommends: 
# evince,
# btrfs-tools,
# transmission-gtk,
# network-manager-gnome,
# pulseaudio,
# pulseaudio-module-x11,
# pavucontrol,
# synaptic,
# gnome-keyring,
# policykit-1-gnome,
# gvfs,
# gvfs-backends,
# gvfs-fuse,
#
# bunsen-common,
# bunsen-configs,
# bunsen-conky,
# bunsen-docs,
# bunsen-faenza-icon-theme,
# bunsen-images,
# bunsen-keyring,
# bunsen-os-release,
# bunsen-pipemenus,
# bunsen-themes,
# bunsen-thunar,
# bunsen-utilities,
# bunsen-welcome
# alsa-utils,
# anacron,
# apt-transport-https,
# apt-xapian-index,
# aptitude,
# arandr,
# arj,
# at-spi2-core,
# bash-completion,
# catfish,
# clipit,
# compton,
# conky-all,
# cpufrequtils,
# curl,
# crda,
# dmz-cursor-theme,
# dosfstools,
# eject,
# enchant,
# fbxkb,
# fdpowermon,
# feh,
# file-roller,
# filezilla,
# firefox-esr,
# firmware-b43-installer,
# firmware-b43legacy-installer,
# firmware-linux,
# fonts-cantarell,
# fonts-dejavu,
# fonts-droid,
# fonts-inconsolata,
# fonts-liberation,
# ftp,
# fuse,
# galculator,
# galternatives,
# gdebi,
# geany,
# ghostscript,
# gigolo,
# gksu,
# gmrun,
# gnumeric,
# gparted,
# gsimplecal,
# gstreamer1.0-libav,
# gstreamer1.0-plugins-bad,
# gstreamer1.0-plugins-base,
# gstreamer1.0-plugins-good,
# gstreamer1.0-plugins-ugly,
# gstreamer1.0-pulseaudio,
# hardinfo,
# hdparm,
# hddtemp,
# hexchat,
# htop,
# hwdata,
# i965-va-driver,
# lame,
# libpam-gnome-keyring,
# libreoffice-writer,
# libreoffice-gtk,
# libnotify-bin,
# lightdm,
# light-locker,
# lm-sensors,
# locales,
# lsb-release,
# lxappearance,
# lzop,
# mirage,
# mlocate,
# modemmanager,
# nitrogen,
# ntfs-3g,
# ntp,
# obconf,
# openbox,
# openssh-client,
# p7zip-full,
# pciutils,
# pcmciautils,
# python-keybinder,
# python-notify,
# python-xdg,
# rfkill,
# rpl,
# rsync,
# rzip,
# scrot,
# smartmontools,
# suckless-tools,
# sudo,
# terminator,
# thunar,
# thunar-archive-plugin,
# thunar-media-tags-plugin,
# thunar-volman,
# tint2,
# ttf-mscorefonts-installer,
# tumbler,
# unace,
# unalz,
# unar,
# unrar,
# unzip,
# update-inetd,
# usb-modeswitch,
# usbutils,
# user-setup,
# uuid-runtime,
# va-driver-all,
# vdpau-va-driver,
# vlc,
# vlc-plugin-notify,
# volumeicon-alsa,
# wireless-tools,
# xdg-user-dirs,
# xdg-utils,
# xfburn,
# xfce4-notifyd,
# xfce4-power-manager,
# xfce4-screenshooter,
# xinput,
# xorg,
# xsel,
# xz-utils,
# zip,
