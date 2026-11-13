# Up/Down: search history for the text typed so far (atuin owns Ctrl-R)
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# Terminals send either ESC [ A or ESC O A depending on the keypad mode: bind both
for _key in '^[[A' '^[OA'; do bindkey "$_key" up-line-or-beginning-search; done
for _key in '^[[B' '^[OB'; do bindkey "$_key" down-line-or-beginning-search; done
unset _key

# Home / End / Delete
[[ -n ${terminfo[khome]} ]] && bindkey "${terminfo[khome]}" beginning-of-line
[[ -n ${terminfo[kend]}  ]] && bindkey "${terminfo[kend]}"  end-of-line
[[ -n ${terminfo[kdch1]} ]] && bindkey "${terminfo[kdch1]}" delete-char

# Option+Left/Right: move by word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# Ctrl-S: prepend sudo to the current line
add_sudo() { BUFFER="sudo $BUFFER"; zle end-of-line }
zle -N add_sudo
bindkey '^s' add_sudo

# Ctrl-L: clear the screen and discard what is being typed
clear_screen_and_line() { BUFFER=""; zle clear-screen }
zle -N clear_screen_and_line
bindkey '^l' clear_screen_and_line

# Ctrl-X Ctrl-E: edit the current line in $EDITOR (VS Code)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
