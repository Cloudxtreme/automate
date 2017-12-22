apt-get -y install mozilla-devscripts
apt-get -y install xul-ext-webdeveloper
apt-get -y install xul-ext-itsalltext
apt-get -y install xul-ext-greasemonkey 
apt-get -y install xul-ext-firebug 
apt-get -y install xul-ext-firexpath 

# See https://www.legroom.net/howto/firefox
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
#user_pref("browser.reader.detectedFirstArticle", true);//Disable obnoxious Reader View nag popup


#// Disable Shield Recipe Client
#user_pref("app.shield.optoutstudies.enabled", false);
#user_pref("extensions.shield-recipe-client.enabled", false);

# firefox get menu back: used to use RDF before and the people involved still can't keep it flat. 
# I can't see a simple way to use jq to change a value in-place so resort to here-file.
#xulstore.json
#"chrome://browser/content/browser.xul": {
#    "toolbar-menubar": {
#      "autohide": "true"
#    }
#)

# debian still uses the localstore.rdf store. Probably not firefox-esr FIXME
bash -c "cat > /etc/iceweasel/profile/xulstore.json" <<'EOF'
{
    "about:config": {
        "lockCol": {
            "ordinal": "3"
        },
        "prefCol": {
            "ordinal": "1",
            "sortDirection": "ascending"
        },
        "typeCol": {
            "ordinal": "5"
        },
        "valueCol": {
            "ordinal": "7"
        }
    },
    "chrome://browser/content/browser.xul": {
        "PersonalToolbar": {
            "collapsed": "false"
        },
        "main-window": {
            "height": "683",
            "screenX": "321",
            "screenY": "35",
            "sizemode": "normal",
            "width": "1440"
        },
        "nav-bar": {
            "collapsed": "",
            "currentset": "urlbar-container,search-container,bookmarks-menu-button,downloads-button,home-button,firebug-badged-button,greasemonkey-tbb"
        },
        "navigator-toolbox": {
            "iconsize": "small"
        },
        "sidebar-title": {
            "value": ""
        },
        "toolbar-menubar": {
            "autohide": "false"
        }
    },
    "chrome://browser/content/preferences/cookies.xul": {
        "CookiesDialog": {
            "height": "369",
            "screenX": "720",
            "screenY": "289",
            "width": "480"
        }
    },
    "chrome://browser/content/preferences/preferences.xul": {
        "BrowserPreferences": {
            "lastSelected": "paneAdvanced",
            "screenX": "653",
            "screenY": "176"
        }
    },
    "chrome://browser/content/sanitize.xul": {
        "SanitizeDialog": {
            "screenX": "77",
            "screenY": "207"
        },
        "detailsExpander": {
            "class": "expander-up"
        },
        "itemList": {
            "collapsed": "false"
        }
    },
    "chrome://unplug/content/config/config.xul": {
        "cn_unplug2_config": {
            "lastSelected": "tababout",
            "screenX": "709",
            "screenY": "374"
        }
    }
}
EOF

# FIXME
# Change firefox/iceweasel preferences in /home and /etc prefs.js
## firefox pref value - sets the value of the given user_pref to value variable
#value=2
#for i in "browser.startup.page"
#do
#    if grep $i /etc/iceweasel/profile/prefs.js
#    then
#        echo "Found: " $i
#        sed -i "s#^user_pref(\"$i\",.*);#user_pref(\"browser.startup.page\", $value);#"  /etc/iceweasel/profile/prefs.js
#        sed -i "s#^user_pref(\"$i\",.*);#user_pref(\"browser.startup.page\", $value);#"  /home/*/.mozilla/firefox/*/prefs.js
#    else
#        echo "Not found: " $i
#        echo "user_pref($i, $value);" >> /etc/iceweasel/profile/prefs.js
#        echo "user_pref($i, $value);" >> /home/*/.mozilla/firefox/*/prefs.js
#    fi
#done
#
## firefox pref true - sets the value of the given user_pref to true
#for i in "privacy.trackingprotection.enabled"
#do
#    print $1
#    if grep $i /etc/iceweasel/profile/prefs.js
#    then
#        sed -i -e 's/^user_pref($i, \(true\|false\));$/user_pref($i, true);/' /etc/iceweasel/profile/prefs.js
#        sed -i -e 's/^user_pref($i, \(true\|false\));$/user_pref($i, true);/' /home/*/.mozilla/firefox/*/prefs.js
#    else
#        echo "user_pref($i, true);" >> /etc/iceweasel/profile/prefs.js
#        echo "user_pref($i, true);" >> /home/*/.mozilla/firefox/*/prefs.js
#    fi
#done
#
## firefox pref clear - sets the value of the given user_pref to empty
#for i in "browser.newtabpage.directory.ping" "browser.newtabpage.directory.source" "browser.fixup.alternate.suffix"
#do
#    print $1
#    if grep $i /etc/iceweasel/profile/prefs.js
#    then
#        sed -i -e 's/^user_pref($i, \(*\));$/user_pref($i, \"\");/' /etc/iceweasel/profile/prefs.js
#        sed -i -e 's/^user_pref($i, \(*\));$/user_pref($i, \"\");/' /home/*/.mozilla/firefox/*/prefs.js
#    else
#        echo "user_pref($i, \"\");" >> /etc/iceweasel/profile/prefs.js
#        echo "user_pref($i, \"\");" >> /home/*/.mozilla/firefox/*/prefs.js
#    fi
#done

#PROFILE_NAME="23k5nqzr.default-1404250880109"
#
#PROFILE_DIR="~/.mozilla/firefox/${PROFILE_NAME}"
# 
#for i in "browser.pocket.enabled"
#do
#    print $1
#    if grep $i ${PROFILE_DIR}/prefs.js
#    then
#        sed -i -e 's/^user_pref($i, \(true\|false\));$/user_pref($i, false);/' ${PROFILE_DIR}/prefs.js
#    else
#        echo "user_pref($i, true);" >> ${PROFILE_DIR}/prefs.js
#    fi
#done
#
#network.http.speculative-parallel-limit to 0
#
#PROFILE_NAME="23k5nqzr.default-1404250880109"
#
#PROFILE_DIR="~/.mozilla/firefox/${PROFILE_NAME}"
# 
#for i in "network.http.speculative-parallel-limit"
#do
#    print $1
#    if grep $i ${PROFILE_DIR}/prefs.js
#    then
#        sed -i -e 's/^user_pref($i, \(0\|1\));$/user_pref($i, 0);/' ${PROFILE_DIR}/prefs.js
#    else
#        echo "user_pref($i, true);" >> ${PROFILE_DIR}/prefs.js
#    fi
#done




# FIXME try firefox -install-global-extension ${YOUR_XPI_FILE] in a loop
#ublock-origin                                  https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
#unplug                                         https://addons.mozilla.org/firefox/downloads/latest/2254/addon-2254-latest.xpi
#download youtube videos as mp4                 https://addons.mozilla.org/firefox/downloads/latest/11869/addon-11869-latest.xpi
#itsalltext (edit wikipages in external editor) https://addons.mozilla.org/firefox/downloads/latest/4125/addon-4125-latest.xpi
#web developer                                  https://addons.mozilla.org/firefox/downloads/latest/60/addon-60-latest.xpi
#toggle web developer toolbar                   https://addons.mozilla.org/firefox/downloads/latest/61772/addon-61772-latest.xpi
#firebug                                        https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi
#firebug  palemoon requires 1.12                https://getfirebug.com/releases/firebug/1.12/firebug-1.12.0.xpi
#firepath                                       https://addons.mozilla.org/firefox/downloads/latest/11900/addon-11900-latest.xpi
#greasemonkey                                   https://addons.mozilla.org/firefox/downloads/latest/748/addon-748-latest.xpi
#greasefire2                                    https://addons.mozilla.org/firefox/downloads/latest/567886/addon-567886-latest.xpi
#redirects fixer                                https://addons.mozilla.org/firefox/downloads/latest/371815/addon-371815-latest.xpi
#https everywhere                               https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi


# https://addons.mozilla.org/firefox/downloads/latest/2254/addon-2254-latest.xpi

URLS="
https://addons.mozilla.org/firefox/downloads/latest/748/addon-748-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/567886/addon-567886-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/11869/addon-11869-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/4125/addon-4125-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/60/addon-60-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/11900/addon-11900-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/371815/addon-371815-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/61772/addon-61772-latest.xpi
https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi
"

pwd
EXTENSIONS_HOME="~/.mozilla"
EXTENSIONS_DIR="${EXTENSIONS_HOME}/extensions"
mkdir -p ${EXTENSIONS_DIR} && ls ${EXTENSIONS_DIR}
pwd

COUNTER=0

for URL in ${URLS};
do
	echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	pwd
	cd ${EXTENSIONS_DIR}
	EXTENSION_NAME=`echo ${URL} | awk -F'/' '{ print $8 }'| awk -F'.' '{ print $1 }'`

	echo "---------------------------------------------------------------------------"
	echo EXTENSION URL:       ${URL}
	echo EXTENSIONS HOME:     ${EXTENSIONS_HOME}
	echo EXTENSION DIRECTORY: ${EXTENSIONS_DIR}
	echo EXTENSION NAME:      ${EXTENSION_NAME}
	echo "---------------------------------------------------------------------------"


	echo "---------------------------------------------------------------------------"
	echo Downloading in:
	pwd
	echo "---------------------------------------------------------------------------"

	wget -c ${URL}

	echo UNZIPPING TO: ${EXTENSIONS_DIR}/${EXTENSION_NAME}
	unzip -q -o -d ${EXTENSIONS_DIR}/${EXTENSION_NAME} ${EXTENSION_NAME}.xpi

	echo REMOVING: ${EXTENSIONS_DIR}/${EXTENSION_NAME}.xpi
	rm ${EXTENSIONS_DIR}/${EXTENSION_NAME}.xpi

	#ID=`grep -A3 '<!-- Firefox -->' ${EXTENSION_NAME}/install.rdf | grep \} | awk -F'>' '{ print $2}'| awk -F'<' '{ print $1}'`
	ID=`xmlstarlet sel \
            -N rdf=http://www.w3.org/1999/02/22-rdf-syntax-ns# \
            -N em=http://www.mozilla.org/2004/em-rdf# \
            -t -v "//rdf:Description[@about='urn:mozilla:install-manifest']/em:id"  \
            ${EXTENSION_NAME}/install.rdf`

	echo ID NUMBER:     ${ID}
	echo NUMBER LENGTH: ${#ID}

	if [ -z "${ID}" ];
	then
    		echo "ID empty: poorly formated rdf. next."
	fi	


	echo "---------------------------------------------------------------------------"
	echo ID: ${ID}
	echo "---------------------------------------------------------------------------"
	
	mv ${EXTENSIONS_DIR}/${EXTENSION_NAME} ${ID}
	mkdir -p /var/tmp/extensions
        mkdir -p  ~/.mozilla/extensions/ 
	cp -a ${ID} /usr/share/xul-ext/
        #cp -a ${ID} ~/.mozilla/extensions/ 
	#cp -a ${ID} /var/tmp/extensions/
	#cp -a ${ID} /usr/lib/iceweasel/extensions/
	#cp -a ${ID} /usr/share/mozilla/extensions/
        #cp -a ${ID} ~/.moonchild productions/pale moon/*.default/extensions
	COUNTER=$((COUNTER + 1))
	echo ${COUNTER}
done

# FIXME installing extensions from the commandline - http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts

# xulstore.json has layout settings. But exists in a autogenerated profile at first run.
# FIXME xulstore.json location needs fixing.
# toolbar-menubar 
# PersonalToolbar
bash -c "cat > xulstore.json" <<'EOF'
{
    "chrome://browser/content/browser.xul": {
        "PersonalToolbar": {
            "collapsed": "false"
        },
        "main-window": {
            "height": "1040",
            "screenX": "640",
            "screenY": "92",
            "sizemode": "normal",
            "width": "1280"
        },
        "navigator-toolbox": {
            "iconsize": "small"
        },
        "sidebar-title": {
            "value": ""
        },
        "toolbar-menubar": {
            "autohide": "false"
        }
    }
}
EOF

OPT[0]='.["toolbar-menubar"] = {"autohide" : "false"}'
OPT[1]='.["PersonalToolbar"] = {"collapsed" : "false"}'
for ((i = 0; i < ${#OPT[@]}; ++i)); do
	OPTION="${OPT[$i]}"
	jq "${OPTION}" xulstore.json > xulstore.json.new && \
		mv -b xulstore.json.new xulstore.json
done
