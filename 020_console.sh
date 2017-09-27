# dpkg-reconfigure console-setup

# Original settings
# sed -i 's,^\(ACTIVE_CONSOLES=\).*,\1'\"/dev/tty\[1-6\]\"',' /etc/default/console-setup
# sed -i 's,^\(CHARMAP=\).*,\1'\"UTF-8\"',' /etc/default/console-setup
# sed -i 's,^\(CODESET=\).*,\1'\"Lat15\"',' /etc/default/console-setup
# sed -i 's,^\(FONTFACE=\).*,\1'\"Fixed\"',' /etc/default/console-setup
# sed -i 's,^\(FONTSIZE=\).*,\1'\"8x16\"',' /etc/default/console-setup
# sed -i 's,^\(VIDEOMODE=\).*,\1'\"\"',' /etc/default/console-setup

# Terminus - Uni2-Terminus16.psf.gz
#sed -i 's,^\(ACTIVE_CONSOLES=\).*,\1'\"/dev/tty\[1-6\]\"',' /etc/default/console-setup
#sed -i 's,^\(CHARMAP=\).*,\1'\"UTF-8\"',' /etc/default/console-setup
#sed -i 's,^\(CODESET=\).*,\1'\"guess\"',' /etc/default/console-setup
#sed -i 's,^\(FONTFACE=\).*,\1'\"Terminus\"',' /etc/default/console-setup
#sed -i 's,^\(FONTSIZE=\).*,\1'\"8x16\"',' /etc/default/console-setup
#sed -i 's,^\(VIDEOMODE=\).*,\1'\"\"',' /etc/default/console-setup

# Powerline - ter-powerline-v16b.psf.gz
wget -c --directory-prefix /usr/share/fonts/PSF https://github.com/powerline/fonts/raw/master/Terminus/PSF/ter-powerline-v16b.psf.gz
sed -i 's,^\(ACTIVE_CONSOLES=\).*,\1'\"/dev/tty\[1-6\]\"',' /etc/default/console-setup
sed -i 's,^\(CHARMAP=\).*,\1'\"UTF-8\"',' /etc/default/console-setup
sed -i 's,^\(CODESET=\).*,\1'\"guess\"',' /etc/default/console-setup
sed -i 's,^\(FONTFACE=\).*,\1'\"Terminess Powerline\"',' /etc/default/console-setup
sed -i 's,^\(FONTSIZE=\).*,\1'\"8x16\"',' /etc/default/console-setup
sed -i 's,^\(VIDEOMODE=\).*,\1'\"\"',' /etc/default/console-setup
echo "FONT=/usr/share/fonts/PSF/ter-powerline-v16b.psf" >> /etc/default/console-setup
