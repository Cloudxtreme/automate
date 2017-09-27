wget -c --directory-prefix=/var/tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i /var/tmp/google-chrome-stable_current_amd64.deb
apt-get -f install
apt-get autoremove
apt-get clean

# The post install script does a few things that assume installing chrome means you want it as
# the default browser and that it should auto update whenever it sees fit.
 
#Setting up google-chrome-stable (61.0.3163.100-1) ...
#update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/x-www-browser (x-www-browser) in auto mode
#update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/gnome-www-browser (gnome-www-browser) in auto mode
#update-alternatives: using /usr/bin/google-chrome-stable to provide /usr/bin/google-chrome (google-chrome) in auto mode

#sudo update-alternatives --query x-www-browser
# 
#Name: x-www-browser
#Link: /usr/bin/x-www-browser
#Slaves:
# x-www-browser.1.gz /usr/share/man/man1/x-www-browser.1.gz
#Status: auto
#Best: /usr/bin/google-chrome-stable
#Value: /usr/bin/google-chrome-stable
#
#Alternative: /usr/bin/firefox-esr
#Priority: 70
#Slaves:
# x-www-browser.1.gz /usr/share/man/man1/firefox-esr.1.gz
#
#Alternative: /usr/bin/google-chrome-stable
#Priority: 200
#Slaves:

# Lets undo this:

PRIORITY=50

update-alternatives --install /usr/bin/x-www-browser x-www-browser \
  /usr/bin/google-chrome-stable $PRIORITY
update-alternatives --install /usr/bin/gnome-www-browser gnome-www-browser \
  /usr/bin/google-chrome-stable $PRIORITY

update-alternatives --install /usr/bin/google-chrome google-chrome \
  /usr/bin/google-chrome-stable $PRIORITY

#----
# The post install script removes previous sources.list
#apt-config shell APT_SOURCEDIR 'Dir::Etc::sourceparts/d'
#APT_SOURCEDIR='/etc/apt/sources.list.d/'
#  rm -f "$APT_SOURCESDIR/google-chrome.list" \
#        "$APT_SOURCESDIR/google-chrome-stable.list"
# Don't do anything if the file isn't there, since that probably means the
# user disabled it.
rm -rf /etc/apt/sources.list.d/google-chrome.list

cat > /etc/apt/sources.list.d-available/google-chrome-stable.list << EOF 
# wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

ln -sf /etc/apt/sources.list.d-available/google-chrome-stable.list /etc/apt/sources.list.d/google-chrome-stable.list


#----
#if [ ! -e "$DEFAULTS_FILE" ]; then
#  echo 'repo_add_once="true"' > "$DEFAULTS_FILE"
#  echo 'repo_reenable_on_distupgrade="true"' >> "$DEFAULTS_FILE"
#fi
#
#cat /etc/default/google-chrome
#repo_add_once="false"
#repo_reenable_on_distupgrade="true"
DEFAULTS_FILE="/etc/default/google-chrome"
sed -i -e 's/^repo_add_once=.*$/repo_add_once=\"false\"/' ${DEFAULTS_FILE}
sed -i -e 's/^repo_reenable_on_distupgrade=.*$/repo_reenable_on_distupgrade=\"false\"/' ${DEFAULTS_FILE}
#----
# Remove daily cron optional with above changes to default

# It creates the repository configuration file for package updates, and it
# monitors that config to see if it has been disabled by the overly aggressive
# distro upgrade process (e.g.  intrepid -> jaunty). When this situation is
# detected, the respository will be re-enabled. If the respository is disabled
# for any other reason, this won't re-enable it.
#
# This functionality can be controlled by creating the $DEFAULTS_FILE and
# setting "repo_add_once" and/or "repo_reenable_on_distupgrade" to "true" or
# "false" as desired. An empty $DEFAULTS_FILE is the same as setting both values
# to "false".
#rm /etc/cron.daily/google-chrome

