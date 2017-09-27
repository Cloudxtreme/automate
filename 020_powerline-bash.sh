bash -c "cat > /etc/profile.d/powerline.sh" <<EOF
if [ -f $(which powerline-daemon) ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi
EOF

mkdir -p ~/.config/powerline
bash -c "cat > ~/.config/powerline/config.json" <<EOF 
{
    "ext": {
        "shell": {
            "theme": "default_leftonly"
        }
    }
}
EOF

powerline-daemon --replace
