# home binaries
if [ -d $HOME/bin ]; then
	export PATH=$HOME/bin:$PATH
fi

# homebrew config (feat. support for rosetta software)
if [ -d /usr/local/Homebrew -a "$(uname -m)" = "x86_64" ]; then
	eval "$(/usr/local/Homebrew/bin/brew shellenv)"
elif [ -d /opt/homebrew -a "$(uname -m)" = "arm64" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
