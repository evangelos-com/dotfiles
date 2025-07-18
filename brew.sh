#!/usr/bin/env bash

set -e

# Function to install Homebrew if not already installed
install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

# Function to install command-line tools
install_cli_tools() {
  # Install GNU core utilities
  brew install coreutils
  BREW_PREFIX=$(brew --prefix)
  if [ ! -f "${BREW_PREFIX}/bin/sha256sum" ]; then
    ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
  fi

  brew install moreutils
  brew install findutils
  brew install gnu-sed
  brew install bash
  brew install bash-completion2
  brew install wget
  brew install vim
  brew install grep
  brew install openssh
  brew install screen
  brew install gmp
  brew install ack
  brew install diff-so-fancy
  brew install git
  brew install git-lfs
  brew install rename
  brew install mysql

  brew install stripe/stripe-cli/stripe

  # Switch to using brew-installed bash as default shell
  if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
    echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
    chsh -s "${BREW_PREFIX}/bin/bash";
  fi;
}

# Function to install font tools
install_font_tools() {
  brew tap bramstein/webfonttools
  brew install sfnt2woff
  brew install sfnt2woff-zopfli
  brew install woff2
}

# Function to install graphical applications
install_graphical_apps() {
  apps=(
    visual-studio-code
    brave-browser
    google-chrome
    firefox
    postman
    sequel-ace
    docker
    discord
    slack
    libreoffice
    rectangle
    linearmouse
    knockknock
  )

  for app in "${apps[@]}"; do
    if brew list --cask "$app" &> /dev/null; then
      brew upgrade --cask "$app"
    else
      brew install --cask "$app"
    fi
  done
}

# Main function
main() {
  brew update
  brew upgrade
  install_homebrew
  install_cli_tools
  install_font_tools
  install_graphical_apps
  brew cleanup
}

main