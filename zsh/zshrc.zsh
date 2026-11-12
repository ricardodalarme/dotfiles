# ──────────────────────────────────────────────────────────────
# Main zsh config. Sourced from ~/.zshrc.
# Order matters: PATH → options → fpath → prompt/fzf → plugins
# (compinit runs inside the plugin bundle) → atuin/zoxide/mise.
# ──────────────────────────────────────────────────────────────
export DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# ── PATH ──────────────────────────────────────────────────────
typeset -U path PATH   # no duplicates
path=(
  $HOME/bin
  $HOME/.local/bin
  $HOME/.mint/bin
  $HOME/.fly/bin
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  $path
)

# Android SDK
for _sdk in $HOME/Library/Android/sdk $HOME/Android/Sdk; do
  if [[ -d $_sdk ]]; then
    export ANDROID_HOME=$_sdk
    path+=($_sdk/emulator $_sdk/platform-tools $_sdk/cmdline-tools/latest/bin)
    break
  fi
done
unset _sdk
path=(${^path}(N-/))   # drop entries that don't exist

export EDITOR="code --wait"
export VISUAL="$EDITOR"

# ── History ───────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY       # store timestamps
setopt SHARE_HISTORY          # share between sessions (implies incremental append)
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE      # commands starting with a space are not saved

# ── Shell behaviour ───────────────────────────────────────────
setopt AUTO_CD                # type a directory name to cd into it
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_FLOW_CONTROL        # frees Ctrl-S / Ctrl-Q
bindkey -e                    # emacs-style line editing

# ── fpath (completions) ───────────────────────────────────────
if command -v brew >/dev/null; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi
fpath=(
  $HOME/.docker/completions
  $HOME/completions
  $fpath
)

# ── Prompt, fzf ───────────────────────────────────────────────
command -v starship >/dev/null && eval "$(starship init zsh)"
if command -v fzf >/dev/null; then
  source <(fzf --zsh)
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
  export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :200 {}'"
  export FZF_ALT_C_OPTS="--preview 'eza -1 --color=always {}'"
fi

# ── Plugins (antidote) ────────────────────────────────────────
# Plugin list: zsh/plugins.txt. The static bundle (plugins.zsh) is
# generated automatically and is git-ignored.
_antidote="$(brew --prefix 2>/dev/null)/opt/antidote/share/antidote/antidote.zsh"
if [[ -r $_antidote ]]; then
  source "$_antidote"
  zstyle ':antidote:bundle' file "$DOTFILES/zsh/plugins.txt"
  zstyle ':antidote:static' file "$DOTFILES/zsh/plugins.zsh"
  antidote load
fi
unset _antidote

# fzf-tab previews
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*'  fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# ── History search (atuin), smart cd (zoxide) ─────────────────
command -v atuin >/dev/null && eval "$(atuin init zsh --disable-up-arrow)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# ── Aliases ───────────────────────────────────────────────────
alias ls='eza --group-directories-first --icons=auto'
alias ll='eza -l --group-directories-first --icons=auto --git'
alias la='eza -la --group-directories-first --icons=auto --git'
alias lt='eza --tree --level=2 --icons=auto'
alias cat='bat --paging=never'
alias dotup='git -C "$DOTFILES" pull --ff-only && antidote update'
[[ "$(uname -s)" == Darwin ]] && alias rosetta='arch -x86_64 zsh --login'

# List the directory after every cd / z (replaces the old `cd` wrapper)
chpwd() { [[ -o interactive && -t 0 && -t 1 ]] && eza --group-directories-first --icons=auto }

# ── Keybindings ───────────────────────────────────────────────
source "$DOTFILES/zsh/keybindings.zsh"

# ── Tool versions: keep last, it can alter PATH per project ───
command -v mise >/dev/null && eval "$(mise activate zsh)"
