
cd /var/tmp
#ARDUINO_VERSION=1.8.3
ARDUINO_VERSION=nightly
wget -c https://downloads.arduino.cc/arduino-${ARDUINO_VERSION}-linux64.tar.xz && \
	cd /opt && \
	tar xf /var/tmp/arduino-${ARDUINO_VERSION}-linux64.tar.xz

sudo usermod -a -G dialout $USER && \
sudo apt-get install git python-serial

mkdir -p ~/Arduino/hardware/espressif && \
	cd ~/Arduino/hardware/espressif && \
	git clone https://github.com/espressif/arduino-esp32.git esp32 && \
	cd esp32/tools/ && \
	python get.py


