#!/bin/bash 
set -e
set -x
# A collection of fonts to install to support nerdfont/powerline patched fonts that are missing.

#http://nerdfonts.com/#downloads
#https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/DejaVuSansMono.zip

RELEASE=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep tarball_url | cut -d '"' -f 4 | awk -F "/" {'print $8'})
FONT_NAMES=( \
	# 3270 \
	# AnonymousPro \
	# AurulentSansMono \
	# BitstreamVeraSansMono \
	# CodeNewRoman \
 	DejaVuSansMono \
	# DroidSansMono \
	# FantasqueSansMono \
	# FiraCode \
	# FiraMono \
	# Gohu \
	# Hack \
	# Hasklig \
	# HeavyData \
	# Hermit \
	# Inconsolata \
	# InconsolataGo \
	# Iosevka \
	# Lekton \
	# LiberationMono \
	Meslo \
	# Monofur \
	# Monoid \
	# Mononoki \
	# MPlus \
	# ProFont \
	# ProggyClean \
	# RobotoMono \
	# ShareTechMono \
	# SourceCodePro \
	# SpaceMono \
	Terminus \
	# Ubuntu \
	# UbuntuMono \
)

TMP_DIR=/var/tmp

#FONT_DIR=/usr/share/fonts/truetype
FONT_DIR=/usr/local/share/fonts/truetype
#FONT_DIR=~/.fonts
#FONT_DIR=~/.local/share/fonts/truetype

URL_ROOT=https://github.com/ryanoasis/nerd-fonts/releases/download

mkdir -p ${FONT_DIR}
mkdir -p ${TMP_DIR}

# Will get only the selected fonts
for FONT in "${FONT_NAMES[@]}"; do
	wget -c --directory-prefix="${TMP_DIR}" ${URL_ROOT}/${RELEASE}/${FONT}.zip
	mkdir -p "${FONT_DIR}"/"${FONT}"-nerd
	unzip "${TMP_DIR}"/"${FONT}".zip -d "${FONT_DIR}"/${FONT}-nerd/
done

## Will get all available fonts
#URL_LIST=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | cut -d '"' -f 4)
#for URL in "${URL_LIST[@]}"; do
#	wget -c --directory-prefix="${TMP_DIR}" "${FONT_NAME}"
#	FONT_NAME=$(echo "${URL}" | awk -F '/' {'print $9'} | awk -F "." {'print $1'})
#	mkdir -p "${FONT_DIR}"/"${FONT_NAME}"-nerd
#	unzip "${TMP_DIR}"/"${FONT_NAME}".zip -d "${FONT_DIR}"
#done

fc-cache -f -v
