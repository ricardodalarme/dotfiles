time_out() { perl -e 'alarm shift; exec @ARGV' "$@"; }

echo "Updating configuration"
(cd ~/dotfiles && time_out 3 git pull && time_out 3 git submodule update --init --recursive)
#(cd ~/dotfiles && git pull && git submodule update --init --recursive)
source ~/dotfiles/zsh/zshrc.sh
