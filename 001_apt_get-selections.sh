# copy a get-selections from the livecd (install your prefered programs beforehand)
## Backup:
dpkg --get-selections > /var/tmp/packages.list
/usr/bin/apt-mark showauto > /var/tmp/pkgs_auto.lst
/usr/bin/apt-mark showmanual > /var/tmp/pkgs_manual.lst
 
