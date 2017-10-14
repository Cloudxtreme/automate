dpkg -l | awk '$1=="ii" {print $2}' | xargs -rn1 -I+ sh -c "dpkg -L + | grep --label=+ -Hw systemd" > systemd-references.txt
