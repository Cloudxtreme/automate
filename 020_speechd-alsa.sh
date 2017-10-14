# Given a choice of selecting settings to match pulseaudio if installedor alsa when not, they just install it broken and recommend pulseaudio, nice.

#apt-get install speech-dispatcher speech-dispatcher-espeak-ng python3-speechd espeek-ng espeak-ng-espeak 

SPEECHD_CONF=/etc/speech-dispatcher/speechd.conf

# Uncommented settings
sed -i 's,^\(LogLevel \).*,\1'4',' ${SPEECHD_CONF}
sed -i 's,^\(LogDir \).*,\1'\"default\"',' ${SPEECHD_CONF}
sed -i 's,^\(DefaultVolume \).*,\1'100',' ${SPEECHD_CONF}
sed -i 's,^\(DefaultModule \).*,\1'festival',' ${SPEECHD_CONF}
sed -i 's,^\(Include \).*,\1'\"clients\/\*\.conf\"',' ${SPEECHD_CONF}


# Commented - no space
sed -i '/^#AddModule \"festival\".*/ s/.*/&\nAddModule \"festival\" \"sd_festival\" \"festival.conf\"/'  ${SPEECHD_CONF}

sed -i '/^#LanguageDefaultModule \"en\".*/ s/.*/&\nLanguageDefaultModule \"en\"  \"festival\"/'  ${SPEECHD_CONF}

sed -i '/^#AudioALSADevice \"default\".*/ s/.*/&\nAudioALSADevice \"default\"/'  ${SPEECHD_CONF}

# Commented - single space
sed -i '/^# AudioOutputMethod \"pulse\".*/ s/.*/&\nAudioOutputMethod \"alsa\"/'  ${SPEECHD_CONF}



