# http://www.zshwiki.org/home/zle/vi-mode
# 
cat > ~/.vimrc <<'EOF'
# Set vi command-line mode
bindkey -v

# Use right prompt to display vi mode.
precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="(CMD)"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

# Vim bindings.
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

# In Vim backspace doesn't stop at the point where you started insert mode: 
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# 
bindkey '^G' what-cursor-position

# Text Objects
# Some are provided as shell functions so need to be manually enabled. select-bracketed which selects 
# text delimited by brackets and select-quoted which selects text delimited by quote characters. 
# The following binds them to key combinations such as i" a( in both the visual and viopp keymaps. 
autoload -U select-bracketed select-quoted
zle -N select-bracketed
zle -N select-quoted
  for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}"${(s..):-\'\"\`\|,./:;-=+@}"; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..):-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Clipboard integration using xclip
[[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | xclip
  }

  zle_cut_widgets=(
    vi-backward-delete-char
    vi-change
    vi-change-eol
    vi-change-whole-line
    vi-delete
    vi-delete-char
    vi-kill-eol
    vi-substitute
    vi-yank
    vi-yank-eol
  )
  for widget in $zle_cut_widgets
  do
    zle -N $widget cutbuffer
  done

  function putbuffer() {
    zle copy-region-as-kill "$(xclip -o)"
    zle .$WIDGET
  }

  zle_put_widgets=(
    vi-put-after
    vi-put-before
  )
  for widget in $zle_put_widgets
  do
    zle -N $widget putbuffer
  done
}
EOF
