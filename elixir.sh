#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install elixir
brew install node

# Remove outdated versions from the cellar.
brew cleanup

# Install phoenix -> assumes we already have postgres

# Make sure hex is installed
mix local.hex

# Install phoenix from github
mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.1.1/phoenix_new-1.1.1.ez



