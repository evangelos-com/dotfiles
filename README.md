# Evangelos' dotfiles

## Installation of dotfiles
NOTE: these were written for a bash terminal, not zsh which comes default in newer versions of macOS (Sonoma for example).  `.bash_prompt` colours do not work in zsh.  List available shells `cat /etc/shells`.  Change default shell to bash `chsh -s /bin/bash`

Run the very simple install script to pull in the latest version and copy the files to ~/, your home directory.
```bash
./install.sh
```
Source .macos
```base
source ~/.macos
```

## Installation of Homebrew formulae
When setting up a new Mac, use the following command to install some common Homebrew formulae (after installing Homebrew, of course):
```bash
./brew.sh
```

## Credit
These dotfiles are heavily based on, or directly cherry-picked, from https://github.com/mathiasbynens/dotfiles
