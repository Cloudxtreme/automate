mkdir -p /etc/apt//sources.list-available || exit
cat > /etc/apt/sources.list-available << EOF
# curl https://bintray.com/user/downloadSubjectPublicKey\?username\=hawkeye116477 | sudo apt-key add -
deb https://dl.bintray.com/hawkeye116477/waterfox-deb release main
EOF

ln -s /etc/apt/sources.list-available/waterfox.list /etc/apt/sources.list.d/waterfox.list

curl https://bintray.com/user/downloadSubjectPublicKey\?username\=hawkeye116477 | sudo apt-key add -

apt-get update

apt-get install -y waterfox

