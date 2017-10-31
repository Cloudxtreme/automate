# Fossamail (thunderbird v24/25b era)
# Fosshub gives expiring links that makes wget difficult.
# wget -c --directory-prefix /var/tmp http://www.fossamail.org/
#FOSSAMAIL_VERSION=25.2.4
FOSSAMAIL_VERSION=38.0.0
FOSSAMAIL_FILENAME=FossaMail-${FOSSAMAIL_VERSION}.linux-x86_64.tar.bz2

wget -c --directory-prefix /var/tmp http://relmirror.fossamail.org/${FOSSAMAIL_VERSION}/${FOSSAMAIL_FILENAME}
rm -rf /opt/Fossamail-old
mv /opt/FossaMail /opt/FossaMail-old
tar -xjvf /var/tmp/${FOSSAMAIL_FILENAME} -C /opt

#git clone -b 25.1_RelBranch -single-branch https://github.com/MoonchildProductions/FossaMail /opt/FossaMail

bash -c "cat > /usr/share/applications/fossamail.desktop" <<'EOF'
[Desktop Entry]
Encoding=UTF-8
Name=Fossamail
GenericName=Mail Client
Name[ca]=Client de correu Fossamail
Name[pl]=Fossamail
Comment=Email client based on Palemoon
Comment[ca]=Llegiu i escriviu correu
Comment[de]=Emails lesen und verfassen
Comment[fr]=Lire et écrire votre mél
Comment[pl]=Klient poczty oparty na Palemoon 
Exec=/opt/FossaMail/FossaMail %u
Icon=/opt/Fossamail/chrome/icons/default/default48.png
Terminal=false
X-MultipleArgs=false
Type=Application
Categories=GTK;Application;Network;Email;
MimeType=message/rfc822;x-scheme-handler/mailto;text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;
StartupWMClass=Thunderbird-bin
StartupNotify=true
EOF

# NOW INTEGRATED Fossamail lightning plugin
#LIGHTNING_VERSION=${FOSSAMAIL_VERSION}
#wget -c --directory-prefix /var/tmp http://relmirror.fossamail.org/${LIGHTNING_VERSION}/lightning-${LIGHTNING_VERSION}.en-US.linux-x86_64.xpi
#gunzip /var/tmp/lightning-25.1.9.en-US.linux-x86_64.xpi.gz
#/opt/FossaMail/FossaMail -install-global-extension lightning-${LIGHTNING_VERSION}.en-US.linux-x86_64.xpi


