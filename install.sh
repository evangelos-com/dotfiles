#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doInstalls() {
  # Install particular version of nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh;
  nvm install v10.16.3;
  # Install particular version of npm
  npm i npm@6.11.3 -g;
}

function doIt() {
  doInstalls;
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "install.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
