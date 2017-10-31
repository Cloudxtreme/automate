set +x
# get and install refracta stuff
# For jessie yad needs to be built from testing/ascii (and gtk3 dep changed in control)
apt-get -y install autotools-dev libgtk2.0-dev pkg-config intltool

cd /usr/src
apt-get source yad
YAD_VERSION=$(apt-cache policy yad|sed -n 3p | sed s/:/\\n/g|sed -n 2p| sed s/-/\\n/g |  sed -e 's/^[ \t]*//' | sed -n 1p)
sed -i -e s/libgtk-3-dev/libgtk2.0-dev/g /usr/src/yad-${YAD_VERSION}/debian/control
sed -i -e s/gtk3/gtk2/g /usr/src/yad-${YAD_VERSION}/debian/rules
cd /usr/src/yad-${YAD_VERSION}
dpkg-buildpackage -us -uc -b
dpkg -i ../yad_${YAD_VERSION}-1_amd64.deb

# Refractasnapshot 10 introduces support of UEFI bootable iso but grub-efi removes grub-pc
#apt-get install -y grub-efi-amd64
apt-get install -y hwinfo

REFRACTAINSTALLERBASE_VERSION=9.3.0
REFRACTAINSTALLER_GUI_VERSION=9.2.2
REFRACTASNAPSHOTBASE_VERSION=10.0.2
REFRACTASNAPSHOT_GUI_VERSION=10.0.2
REFRACTA2USB_VERSION=2.3.6
#SOURCEFORGE_MIRROR=http://downloads.sourceforge.net/project/refracta
SOURCEFORGE_MIRROR=http://sourceforge.mirrorservice.org/r/re/refracta
REFRACTA_LOCATION=tools
#REFRACTA_LOCATION=testing
URL_LIST=( \
	${SOURCEFORGE_MIRROR}/${REFRACTA_LOCATION}/refractasnapshot-base_${REFRACTASNAPSHOTBASE_VERSION}_all.deb \
	${SOURCEFORGE_MIRROR}/${REFRACTA_LOCATION}/refractasnapshot-gui_${REFRACTASNAPSHOT_GUI_VERSION}_all.deb \
	${SOURCEFORGE_MIRROR}/${REFRACTA_LOCATION}/refractainstaller-base_${REFRACTAINSTALLERBASE_VERSION}_all.deb \
	${SOURCEFORGE_MIRROR}/${REFRACTA_LOCATION}/refractainstaller-gui_${REFRACTAINSTALLER_GUI_VERSION}_all.deb \
	${SOURCEFORGE_MIRROR}/${REFRACTA_LOCATION}/refracta2usb-${REFRACTA2USB_VERSION}.deb \
)
#	${SOURCEFORGE_MIRROR}/${REFRACTA_LOCATION}/refracta2usb-${REFRACTA2USB_VERSION}.deb"
#"

#for URL in ${URL_LIST[*]}; do printf "   %s\n" ${URL}; done
#for URL in ${URL_LIST[*]}; do printf "   %s\n" ${URL##*/}; done
for URL in ${URL_LIST[*]}; do printf ${URL}; wget -c ${URL} && dpkg -i ./${URL##*/}; done

apt-get -y -f install
