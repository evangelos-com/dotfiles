# Evangelos' dotfiles

## Installation of dotfiles

### Compatibility Note

These configurations are designed for Bash and may not work as expected in zsh, which is the default shell on newer macOS versions (such as Sonoma). Specifically, `.bash_prompt` colors are not compatible with zsh.

### Switching to Bash

To use these dotfiles with Bash:

* List available shells: `cat /etc/shells`
* Change your default shell to Bash: `chsh -s /bin/bash`

### Installation Steps

Run the install script to pull in the latest version and copy the files to your home directory:
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
