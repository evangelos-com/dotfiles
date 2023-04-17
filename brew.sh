#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`.
brew install wget

# Install more recent versions of some macOS tools.
brew install vim 
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install diff-so-fancy
brew install git
brew install git-lfs
brew install rename
brew install mysql
brew install yarn --ignore-dependencies
brew install postgresql


# Install graphical applications through the Cask project.
brew install --cask postman
brew install --cask viscosity
brew install --cask sequel-pro
brew install --cask visual-studio-code
brew install --cask firefox
# Note that after brew installs Docker, the docker command
# (symbolic link) is not available at /usr/local/bin. Running
# the Docker app for the first time creates this symbolic link.
# ls -l /usr/local/bin/docker*
brew install --cask docker
brew install --cask iterm2
brew install --cask slack
brew install --cask rectangle
brew install --cask 1password


# Install Stripe CLI
brew install stripe/stripe-cli/stripe


# Remove outdated versions from the cellar.
brew cleanup
