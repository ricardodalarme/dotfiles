# Dotfiles

Personal zsh / git / terminal setup for macOS.

## Install

```bash
git clone <this repo> ~/dotfiles
~/dotfiles/deploy
```

`deploy` installs the tools from the [Brewfile](Brewfile), symlinks the configs, adds a one-line hook to `~/.zshrc` and `~/.zprofile`, and creates `~/.gitconfig.local` (your name and email). Existing files are backed up to `~/.dotfiles-backup/`. It is safe to re-run. Open a new terminal afterwards; the first start downloads the zsh plugins.

Machine-specific settings (PATH additions from installers, work-only aliases…) can live in `~/.zshrc` below the hook, or in `~/.gitconfig.local` for git.

Run `dotup` to pull the latest dotfiles and update the plugins.

## Layout

| Path | Purpose |
| --- | --- |
| `zsh/zshrc.zsh` | Main zsh config: PATH, history, options, aliases, tool setup |
| `zsh/plugins.txt` | Plugin list (order matters) |
| `zsh/completion.zsh` | Completion setup and styling |
| `zsh/keybindings.zsh` | Custom key bindings |
| `starship.toml` | Prompt |
| `ghostty/config` | Terminal |
| `gitconfig`, `tigrc` | Git and tig |
| `Brewfile` | Every tool listed below |

## Tools and usage

### Shell

| Tool | Usage |
| --- | --- |
| [starship](https://starship.rs) | Prompt showing directory, git branch and status, command duration, and language versions inside projects that use them. |
| [antidote](https://github.com/mattmc3/antidote) | Plugin manager. Add a plugin to `zsh/plugins.txt`, then open a new shell. |
| [atuin](https://atuin.sh) | `Ctrl-R` opens searchable history with directory and exit code. `atuin register` enables sync across machines. |
| [fzf](https://github.com/junegunn/fzf) | `Ctrl-T` picks a file, `Alt-C` jumps to a directory, with previews. |
| [fzf-tab](https://github.com/Aloxaf/fzf-tab) | `Tab` opens fuzzy completion with previews (try `cd <Tab>`). |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `z <part of a path>` jumps to a frequently used directory. `zi` picks interactively. |
| [mise](https://mise.jdx.dev) | Per-project tool versions (`mise use node@22`). |

Plugins: `zsh-completions` (extra completions), `zsh-autosuggestions` (grey suggestions from history, `→` accepts), `fast-syntax-highlighting`, and `zsh-you-should-use` (reminds you of existing aliases).

### Commands

| Command | Does |
| --- | --- |
| `ls`, `ll`, `la`, `lt` | [eza](https://github.com/eza-community/eza): list, long with git status, include hidden, tree. Directories are listed automatically after `cd`. |
| `cat` | [bat](https://github.com/sharkdp/bat): syntax-highlighted output. |
| `fd` | [fd](https://github.com/sharkdp/fd): find files (`fd pattern`). |
| `rg` | [ripgrep](https://github.com/BurntSushi/ripgrep): search file contents. |
| `btop` | System monitor. |
| `dust` | Disk usage by directory. |
| `tldr <cmd>` | Short practical examples for a command. |
| `jq` | Query and format JSON. |
| `dotup` | Update dotfiles and plugins. |

### Key bindings

| Shortcut | Action |
| --- | --- |
| `Ctrl-R` | Atuin history search |
| `Ctrl-T` / `Alt-C` | fzf file / directory picker |
| `↑` / `↓` | Search history for the text typed so far |
| `Ctrl-S` | Prepend `sudo` to the line |
| `Ctrl-X Ctrl-E` | Edit the current line in VS Code |
| `Option-←` / `Option-→` | Move by word |

### Terminal

[Ghostty](https://ghostty.org) with the JetBrainsMono Nerd Font and Catppuccin themes that follow the macOS light/dark appearance. Edit `ghostty/config` to change it.

## Git

- **[delta](https://github.com/dandavison/delta)** is the pager: readable diffs, `n` / `N` jump between files.
- **[tig](https://jonas.github.io/tig/)** is the terminal git browser. In the main view: `F` fixup commit, `i` autosquash rebase, `C` cherry-pick.
- **Aliases:** `st` (short status), `lg` (graph log), `lease` (force-with-lease push), `undo` (undo last commit, keep changes), `amend`, `wip`, `original` (reset to upstream).
- **Defaults:**
  - `rerere` remembers how you resolved a conflict and reuses it.
  - `rebase.autoSquash`, `autoStash` and `updateRefs` make fixup workflows and stacked branches smoother.
  - `merge.conflictstyle = zdiff3` adds context inside conflict markers.
  - `diff.algorithm = histogram` and `colorMoved` give clearer diffs.
  - `commit.verbose` shows the diff while you write the message.
  - Branches sort by most recent commit.
  - `push.autoSetupRemote`, `pull.rebase` and `fetch.prune` are on.
