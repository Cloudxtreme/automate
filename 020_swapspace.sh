apt-get install swapspace

swappath="/var/lib/swapspace"
lower_freelimit=20
upper_freelimit=60
freetarget=30
min_swapsize=4m
max_swapsize=2g
cooldown=600




sed -i "s#^user_pref(\"$i\",.*);#user_pref(\"browser.startup.page\", $value);#"  /etc/swapspace.conf
sed -i "s|^#swappath=(\"$i\",.*);|user_pref(\"browser.startup.page\", $value);|"  /etc/swapspace.conf

sed -i 's,^\(lat=\).*,\1'52.258744',' ~/.config/redshift.conf
sed -i 's,^\(lat=\).*,\1'52.258744',' ~/.config/redshift.conf


sed -i '/^#swappath=.*/ s/.*/&\nswappath=\"$swappath\"/' /etc/swapspace.conf
sed -i '/^#lower_freelimit=.*/ s/.*/&\nlower_freelimit=\"$lower_freelimit\"/' /etc/swapspace.conf
sed -i '/^#upper_freelimit=.*/ s/.*/&\nupper_freelimit=\"$upper_freelimit\"/' /etc/swapspace.conf
sed -i '/^#freetarget=.*/ s/.*/&\nfreetarget=\"$freetarget\"/' /etc/swapspace.conf
sed -i '/^#min_swapsize=.*/ s/.*/&\nmin_swapsize=\"$min_swapsize\"/' /etc/swapspace.conf
sed -i '/^#max_swapsize=.*/ s/.*/&\nmax_swapsize=\"$max_swapsize\"/' /etc/swapspace.conf
sed -i '/^#cooldown=.*/ s/.*/&\ncooldown=\"$cooldown\"/' /etc/swapspace.conf

/etc/init.d/swapspace restart
