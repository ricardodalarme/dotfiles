# bash-like ^k and ^y
bindkey "^k" kill-line
bindkey "" vi-put-before

# Edit and rerun
function edit_and_run() {
	BUFFER="fc"
	zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run

# clear
function ctrl_l() {
	BUFFER="clear"
	zle accept-line
}
zle -N ctrl_l
bindkey "^l" ctrl_l

# Enter
function enter_line() {
	zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
	BUFFER="sudo "$BUFFER
	zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Home/End/Del
bindkey "OH" beginning-of-line
bindkey "OF" end-of-line
bindkey "^[[3~" delete-char
