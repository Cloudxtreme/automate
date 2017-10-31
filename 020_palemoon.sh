# Palemoon
# Needed to return native unix behavior
# browser.urlbar.autoFill false
# browser.urlbar.clickSelectsAll false
# browser.urlbar.doubleClickSelectsAll true
#
# Tne aufoFill highlights its conpletions and so overwrites the primary buffer, I wish windows like behavior used only the buffer usedforctrl x ctrl v 

PALEMOON_VERSION=27.5.0
PALEMOON_HOME=/opt
wget -c --directory-prefix /var/tmp http://linux.palemoon.org/files/${PALEMOON_VERSION}/palemoon-${PALEMOON_VERSION}.en-US.linux-x86_64.tar.bz2
tar -xjvf /var/tmp/palemoon-${PALEMOON_VERSION}.en-US.linux-x86_64.tar.bz2 -C ${PALEMOON_HOME}
ln -sf ${PALEMOON_HOME}/palemoon/palemoon /usr/bin/palemoon

ln -sf ${PALEMOON_HOME}/palemoon/browser/chrome/icons/default/default16.png /usr/share/icons/hicolor/16x16/apps/palemoon.png
ln -sf ${PALEMOON_HOME}/palemoon/browser/chrome/icons/default/default32.png /usr/share/icons/hicolor/32x32/apps/palemoon.png
ln -sf ${PALEMOON_HOME}/palemoon/browser/chrome/icons/default/default48.png /usr/share/icons/hicolor/48x48/apps/palemoon.png
ln -sf ${PALEMOON_HOME}/palemoon/browser/icons/mozicon128.png /usr/share/icons/hicolor/128x128/apps/palemoon.png
update-alternatives --install /usr/bin/gnome-www-browser gnome-www-browser /usr/bin/palemoon 100

bash -c "cat > /usr/share/applications/palemoon.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Name=Pale Moon Web Browser
Comment=Browse the World Wide Web
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=palemoon %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=palemoon
Categories=Network;WebBrowser;Internet
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
EOF

# Correct select/paste behaviour
# Correct highlight url/search bar # changing profile pref.js is overwritten on restart.
# Remove spaces from directory names

# Reverse palemoons'unification' of behaviour that needlessly stomps on unix/x11 select/paste buffer and autoselect urlbar and search bar. I don't approve, if I wanted windows behaviour I'd use windows.
# https://github.com/MoonchildProductions/Pale-Moon/commit/9e61a9cb01a602c45e4a2d12f95821574d1a65c2

#########################################
# Add thefollowing to user.js, this populates prefs.js
#user_pref("privacy.trackingprotection.enabled "true");
#user_pref("browser.newtabpage.directory.ping "");
#user_pref("browser.newtabpage.directory.source, "");
#user_pref("browser.startup.page", 3);
#user_pref("browser.urlbar.doubleClickSelectsAll", "true");
#user_pref("browser.urlbar.clickSelectsAll", "false");
#user_pref("clipboard.autocopy","false");
#user_pref("general.warnOnAboutConfig", false);
#user_pref("geo.enabled","false");
#user_pref("geo.wifi.uri","localhost");
#user_pref("browser.search.geoip.url","localhost");
#user_pref("browser.search.suggest.enabled","false");
#user_pref("browser.search.geoSpecificDefaults","false");
#user_pref("browser.reader.detectedFirstArticle", "true";//Disable obnoxious Reader View nag popup
#user_pref("browser.fixup.alternate.enabled, "false");// Prevent localhost being converted into http://www.localhost.com
#user_pref("browser.urlbar.autoFill, "false");
#user_pref("browser.urlbar.clickSelectsAll", false");
#user_pref("browser.urlbar.doubleClickSelectsAll", "true");

##########################################
## ${PALEMOON_HOME}/palemoon/browser/app/profile/firefox.js 
##ifdef UNIX_BUT_NOT_MAC 	
#pref("browser.urlbar.clickSelectsAll", false); 	
##else 	
# pref("browser.urlbar.clickSelectsAll", true); 	 pref("browser.urlbar.clickSelectsAll", true);
##endif 	
##ifdef UNIX_BUT_NOT_MAC 	
#pref("browser.urlbar.doubleClickSelectsAll", true); 	
##else 	
# pref("browser.urlbar.doubleClickSelectsAll", false); 	 pref("browser.urlbar.doubleClickSelectsAll", false);
##endif

##########################################
# palemoon-24.6.2-clear-search-button.patch.gz https://forum.palemoon.org/download/file.php?id=1310

#diff -durN palemoon-24.6.2/browser/components/search/content/search.xml palemoon-24.6.2-patched/browser/components/search/content/search.xml
#--- palemoon-24.6.2/browser/components/search/content/search.xml	2014-06-10 03:10:32.000000000 +0200
#+++ palemoon-24.6.2-patched/browser/components/search/content/search.xml	2014-07-05 19:36:25.718774861 +0200
#@@ -60,6 +60,12 @@
#                      onclick="handleSearchCommand(event);"
#                      tooltiptext="&searchEndCap.label;"/>
#         </xul:hbox>
#+        <xul:hbox class="search-clear-container">
#+          <xul:image class="search-clear-button"
#+                     anonid="search-clear-button"
#+                     onclick="handleClearCommand(event);"
#+                     tooltiptext="&searchClear.label;"/>
#+        </xul:hbox>
#       </xul:textbox>
#     </content>
# 
#@@ -460,6 +466,13 @@
#         ]]></body>
#       </method>
# 
#+      <method name="handleClearCommand">
#+        <parameter name="aEvent"/>
#+        <body><![CDATA[
#+          this._textbox.value = "";
#+        ]]></body>
#+      </method>
#+
#       <method name="doSearch">
#         <parameter name="aData"/>
#         <parameter name="aWhere"/>

#diff -durN palemoon-24.6.2/browser/locales/en-US/chrome/browser/searchbar.dtd palemoon-24.6.2-patched/browser/locales/en-US/chrome/browser/searchbar.dtd
#--- palemoon-24.6.2/browser/locales/en-US/chrome/browser/searchbar.dtd	2014-06-10 03:10:32.000000000 +0200
#+++ palemoon-24.6.2-patched/browser/locales/en-US/chrome/browser/searchbar.dtd	2014-07-05 19:36:17.842121171 +0200
#@@ -4,3 +4,4 @@
# 
# <!ENTITY cmd_engineManager.label        "Manage Search Engines…">
# <!ENTITY searchEndCap.label             "Search">
#+<!ENTITY searchClear.label              "Clear search box">

#diff -durN palemoon-24.6.2/browser/themes/linux/searchbar.css palemoon-24.6.2-patched/browser/themes/linux/searchbar.css
#--- palemoon-24.6.2/browser/themes/linux/searchbar.css	2014-06-10 03:10:32.000000000 +0200
#+++ palemoon-24.6.2-patched/browser/themes/linux/searchbar.css	2014-07-05 18:41:18.442023427 +0200
#@@ -62,6 +62,17 @@
#   cursor: pointer;
# }
# 
#+/* Search clear button */
#+.search-clear-container {
#+  -moz-box-align: center;
#+}
#+
#+.search-clear-button {
#+  padding: 1px;
#+  list-style-image: url(moz-icon://stock/gtk-clear?size=menu);
#+  cursor: pointer;
#+}
#+
# menuitem[cmd="cmd_clearhistory"] {
#   list-style-image: url("moz-icon://stock/gtk-clear?size=menu");
# }

#diff -durN palemoon-24.6.2/browser/themes/osx/searchbar.css palemoon-24.6.2-patched/browser/themes/osx/searchbar.css
#--- palemoon-24.6.2/browser/themes/osx/searchbar.css	2014-06-10 03:10:32.000000000 +0200
#+++ palemoon-24.6.2-patched/browser/themes/osx/searchbar.css	2014-07-05 18:58:05.260364769 +0200
#@@ -47,6 +47,15 @@
#   list-style-image: url("chrome://browser/skin/Search.png");
# }
# 
#+.search-clear-container {
#+  -moz-box-align: center;
#+  -moz-padding-end: 6px;
#+}
#+
#+.search-clear-button {
#+  list-style-image: url("chrome://browser/skin/sync-16.png");
#+}
#+
# @media (min-resolution: 2dppx) {
#   .searchbar-engine-image,
#   .searchbar-engine-menuitem > .menu-iconic-left > .menu-iconic-icon {

#diff -durN palemoon-24.6.2/browser/themes/windows/searchbar.css palemoon-24.6.2-patched/browser/themes/windows/searchbar.css
#--- palemoon-24.6.2/browser/themes/windows/searchbar.css	2014-06-10 03:10:32.000000000 +0200
#+++ palemoon-24.6.2-patched/browser/themes/windows/searchbar.css	2014-07-05 18:45:08.461644486 +0200
#@@ -76,6 +76,22 @@
#   -moz-image-region: rect(0px, 48px, 16px, 32px);
# }
# 
#+/* ::::: search-clear-button ::::: */
#+
#+.search-clear-container {
#+  -moz-box-align: center;
#+}
#+
#+.search-clear-button {
#+  padding: 1px;
#+  list-style-image: url("chrome://global/skin/icons/Search-close.png");
#+  -moz-image-region: rect(0px 16px 16px 0px);
#+}
#+
#+.search-clear-button:-moz-locale-dir(rtl) {
#+  transform: scaleX(-1);
#+}
#+
# .searchbar-engine-menuitem[selected="true"] > .menu-iconic-text {
#   font-weight: bold;
# }

################################
# Conf and profile directories
# ~/.moonchild\ productions/
# ~/.moonchild\ productions/pale moon/

