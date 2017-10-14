wget -qO - https://downloads.iridiumbrowser.de/ubuntu/iridium-release-sign-01.pub|sudo apt-key add -

cat <<EOF | sudo tee /etc/apt/sources.list-available/iridium-browser.list
# wget -qO - https://downloads.iridiumbrowser.de/ubuntu/iridium-release-sign-01.pub|sudo apt-key add -
deb [arch=amd64] https://downloads.iridiumbrowser.de/deb/ stable main
#deb-src https://downloads.iridiumbrowser.de/deb/ stable main
EOF

ln -sf /etc/apt/sources.list-available/iridium-browser.list /etc/apt/sources.list.d/iridium-browser.list
