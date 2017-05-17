# Fix one pixel window grab
# http://sevkeifert.blogspot.ca/2014/12/increase-window-border-size-in-xubuntu.html
# https://github.com/shimmerproject/Numix/commit/31ae74ab28a1a9af16c00a394ab30161c86cd48d

themes_home=/usr/share/themes
theme_name=Greybird
#sudo cp -a $theme_home/$theme_name/ $theme_home/$theme_name-old
#
#sudo bash -c "cat > $themes_home/$theme_name/left-inactive.xpm" <<'EOF'
#/* XPM */
#static char * left_inactive_xpm[] = {
#"3 21 2 1",
#" 	c None",
#".	c #393939",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"..."};#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/left-active.xpm" <<'EOF'
#/* XPM */
#static char * left_active_xpm[] = {
#"3 21 2 1",
#" 	c None",
#".	c #484848",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"...",
#"..."};#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/right-active.xpm" <<'EOF'
#/* XPM */
#static char * right_active_xpm[] = {
#"4 24 2 1",
#"      c None",
#".      c #7C7C7C",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x",
#"...x"};
#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/bottom-inactive.xpm" <<'EOF'
#/* XPM */
#static char * bottom_inactive_xpm[] = {
#"8 3 2 1",
#"      c None",
#".      c #393939",
#"........................",
#"........................",
#"........................"};
#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/bottom-active.xpm" <<'EOF'
#/* XPM */
#static char * bottom_active_xpm[] = {
#"8 3 2 1",
#"      c None",
#".      c #484848",
#"........................",
#"........................",
#"........................"};
#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/bottom-left-inactive.xpm" <<'EOF'
#/* XPM */
#static char * bottom_left_inactive_xpm[] = {
#"16 16 2 1",
#" 	c None",
#".	c #393939",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"................",
#"................",
#"................",
#" ..............."};
#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/bottom-left-active.xpm" <<'EOF'
#/* XPM */
#static char * bottom_left_active_xpm[] = {
#"16 16 2 1",
#" 	c None",
#".	c #484848",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"....            ",
#"................",
#"................",
#"................",
#" ..............."};
#EOF
#
#sudo bash -c "cat > $themes_home/$theme_name/bottom-right-inactive.xpm" <<'EOF'
#/* XPM */
#static char * bottom_right_inactive_xpm[] = {
#"16 16 2 1",
#" 	c None",
#".	c #393939",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"................",
#"................",
#"................",
#"............... "};
#EOF

#sudo bash -c "cat > $themes_home/$theme_name/bottom-right-active.xpm" <<'EOF'
#/* XPM */
#static char * bottom_right_active_xpm[] = {
#"16 16 2 1",
#" 	c None",
#".	c #484848",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"            ....",
#"................",
#"................",
#"................",
#"............... "};
#EOF

# Create copy of Greybird
sudo cp -r   ${themes_home}/${theme_name}   ${themes_home}/${theme_name}-thick

# copy borders from Daloa to new theme
sudo cp ${themes_home}/Daloa/xfwm4/bottom-active.xpm          ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/bottom-inactive.xpm        ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/left-active.xpm            ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/left-inactive.xpm          ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/right-active.xpm           ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/right-inactive.xpm         ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/bottom-left-active.xpm     ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/bottom-left-inactive.xpm   ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/bottom-right-active.xpm    ${themes_home}/${theme_name}-thick/xfwm4/
sudo cp ${themes_home}/Daloa/xfwm4/bottom-right-inactive.xpm  ${themes_home}/${theme_name}-thick/xfwm4/

# Find/Replace the colors in the new theme with grey colors
sudo sed -i -e 's/C0C0C0/CECECE/'  $themes_home/${theme_name}-thick/xfwm4/*
sudo sed -i -e 's/A0A0FF/7C7C7C/'  $themes_home/${theme_name}-thick/xfwm4/*
sudo sed -i -e 's/E0E0FF/E0E0E0/'  $themes_home/${theme_name}-thick/xfwm4/*

xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird-thick"

sudo xfwm4 --replace &
