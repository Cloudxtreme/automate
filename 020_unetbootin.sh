# https://unetbootin.github.io/linux_download.html

#add-apt-repository ppa:gezakovacs/ppa
#apt-get update
#apt-get install unetbootin

cd /var/tmp
wget -c https://github.com/unetbootin/unetbootin/releases/download/655/unetbootin-linux64-655.bin
chmod +x ./unetbootin-linux-*
apt-get install p7zip-full
./unetbootin-linux-*
