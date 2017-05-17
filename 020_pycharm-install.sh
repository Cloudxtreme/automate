## pycharm python ide
#PYCHARM_VERSION=2016.3
#cd /var/tmp && wget -c https://d1opms6zj7jotq.cloudfront.net/python/pycharm-community-${PYCHARM_VERSION}.tar.gz && tar xzvf /var/tmp/pycharm-community-${PYCHARM_VERSION}.tar.gz 
#cd /var/tmp/pycharm-community-${PYCHARM_VERSION} 

#cat << EF > ./install_pycharm.sh
#PYCHARM_VERSION=${PYCHARM_VERSION}
##cd /var/tmp
##wget -c http://download-cf.jetbrains.com/python/pycharm-community-${PYCHARM_VERSION}.tar.gz
#tar xzvf /var/tmp/pycharm-community-${PYCHARM_VERSION}.tar.gz -C /opt
#ln -fs /opt/pycharm-community-${PYCHARM_VERSION} /opt/pycharm
#ln -s /opt/pycharm/bin/pycharm.sh /usr/local/bin/pycharm
#ln -s /opt/pycharm/bin/inspect.sh /usr/local/bin/inspect

#cat << EOF > /opt/pycharm/pycharm.desktop
#[Desktop Entry]
#Type=Application
#Name=pyCharm IDE
#GenericName=Integrated Development Environment
#Comment=An IDE for the python programming language
#Exec=/opt/pycharm/bin/pycharm.sh
#Icon=/opt/pycharm/bin/pycharm.png
#Terminal=false
#Categories=Development;IDE;Electronics;
#MimeType=text/x-python
#Keywords=python;programming;ide;
#EOF
#EF

echo 'checkinstall -y --fstrans=no --install=no bash ./install_pycharm.sh 2>&1 | tee err' > checkinstall_pycharm.sh && sudo bash ./checkinstall_pycharm.sh
sudo dpkg -i /var/tmp/pycharm-community-${PYCHARM_VERSION}/pycharm-community_${PYCHARM_VERSION}-1_amd64.deb

