# Vars
	if [ -d $HOME/bin ]; then
		export PATH=$HOME/bin:$PATH
	fi

	# android studio tools
	if [ -d $HOME/Android/Sdk ]; then
		export ANDROID_HOME=$HOME/Android/Sdk
		export PATH=$PATH:$ANDROID_HOME/emulator
		export PATH=$PATH:$ANDROID_HOME/tools
		export PATH=$PATH:$ANDROID_HOME/tools/bin
		export PATH=$PATH:$ANDROID_HOME/platform-tools
	fi

	# dart's package system (pub)
	if [ -d $HOME/.pub-cache/bin ]; then
		export PATH=$PATH:$HOME/.pub-cache/bin
	fi

	# flutter version manager
	if [ -d $HOME/fvm/default/bin ]; then
		export PATH=$PATH:$HOME/fvm/default/bin
	fi

	# go lang workspace
	if [ -d $HOME/prog ]; then
		export GOPATH=$HOME/prog/go
	fi

	# updates PATH for the Google Cloud SDK.
	if [ -f '/home/iuriatan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/iuriatan/google-cloud-sdk/path.zsh.inc'; fi

	# enables shell command completion for gcloud.
	if [ -f '/home/iuriatan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/iuriatan/google-cloud-sdk/completion.zsh.inc'; fi

	# Ruby Version Manager
	if [ -d $HOME/.rvm/bin  ]; then
		export PATH="$PATH:$HOME/.rvm/bin"
		[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
	fi

	# asdf (https://asdf-vm.com/)
	if [ -d $HOME/.asdf ]; then
		. $HOME/.asdf/asdf.sh
		fpath=(${ASDF_DIR}/completions $fpath)
		autoload -Uz compinit
		compinit
	fi

	# zsh config
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

# Aliases
	alias v="vim -p"
	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Custom cd
	c() {
		cd $1;
		exa;
	}
	alias cd="c"

# For vim mappings: 
	stty -ixon

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh

