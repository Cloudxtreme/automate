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
dpkg -i ../yad

# Refractasnapshot 10 introduces support of UEFI bootable iso but grub-efi removes grub-pc
#apt-get install -y grub-efi-amd64

REFRACTAINSTALLER_VERSION=9.1.9-1
REFRACTAINSTALLER_GUI_VERSION=9.1.9
REFRACTASNAPSHOT_VERSION=10.0.0
REFRACTASNAPSHOT_GUI_VERSION=10.0.0
REFRACTA2USB_VERSION=2.3.4
REFRACTA_LOCATION=tools
#REFRACTA_LOCATION=testing
URL_LIST=" \
	http://downloads.sourceforge.net/project/refracta/${REFRACTA_LOCATION}/refractasnapshot-base_${REFRACTASNAPSHOT_VERSION}_all.deb \
	http://downloads.sourceforge.net/project/refracta/${REFRACTA_LOCATION}/refractasnapshot-gui${REFRACTASNAPSHOT_GUI_VERSION}_all.deb \
	http://downloads.sourceforge.net/project/refracta/${REFRACTA_LOCATION}/refractainstaller-base_${REFRACTA_VERSION}_all.deb \
	http://downloads.sourceforge.net/project/refracta/${REFRACTA_LOCATION}/refractainstaller-gui_${REFRACTA_GUI_VERSION}_all.deb
"
#	http://downloads.sourceforge.net/project/refracta/${REFRACTA_LOCATION}/refracta2usb-${REFRACTA2USB_VERSION}.deb"
#"

for URL in "${URL_LIST}"; do echo "${URL}"; done

for URL in ${URL_LIST}
do
    FILE=`mktemp`; 
    wget "${URL}" -qO ${FILE} && sudo dpkg -i ${FILE};
    rm ${FILE}
done

sudo apt-get -y -f install
