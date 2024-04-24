# Personal Dotfiles (Application Customizations)

Simple ZShell customizations used in my environment.

## Installation

Clone the repository and execute the command below:

```bash
./deploy
```

The installation script performs the following steps for you:

1. Checks the availability of the following applications:
2. Installs any missing applications using the available package manager.
3. Confirms if zsh is your default shell application and sets it for you.
4. Creates backup copies of existing files that will be replaced during the installation process.

## Summary of Main Definitions

### Operational Structure

The standard dotfiles (`.zshrc`, etc.) load definitions from within the repository. This way, changes are incorporated and synchronized across all machines using this scheme.

When launching a new shell, the first thing executed is `zshrc_manager.sh`. Upon initiation, it updates the dotfiles directory and loads the customizations.

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

* `cd` has been redefined to `cd` + `ls`. Whenever you enter a directory, the contents of that directory are listed.

### Keyboard Shortcuts

| Shortcut | Action                                                                    |
| -------- | ------------------------------------------------------------------------- |
| Ctrl-A*  | Moves to the beginning of the line                                        |
| Ctrl-G   | Executes `git add -A; git commit -v && git push`                          |
| Ctrl-H   | Executes `cd ~/`                                                          |
| Ctrl-K*  | Deletes from the cursor to the end of the line (copies content to buffer) |
| Ctrl-L   | Executes `ls`                                                             |
| Ctrl-O   | Equivalent to the `Enter` key                                             |
| Ctrl-S   | Adds `sudo` to the beginning of the line                                  |
| Ctrl-Y*  | Pastes buffer content immediately before the cursor                       |
_*: as it occurs in bash_

### Plugins

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Searches your history while you type and provides suggestions.
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/ad522a091429ba180c930f84b2a023b40de4dbcc): Provides fish style syntax highlighting for zsh.
* [ohmyzsh](https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3): Borrowed things like tab completion, fixing ls, and a few other things from oh-my-zsh.
