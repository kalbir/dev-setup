#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for asdf
# Install if we don't have it
if test ! $(which asdf); then
  echo "Installing asdf..."
  brew install asdf
fi

# make sure we are using latest version of asdf
brew upgrade asdf

# Install erlang 18 & 19 using asdf and use version 18
asdf plugin-add erlang

# Install phoenix -> assumes we already have postgres

# Make sure hex is installed
mix local.hex

# Install phoenix
mix archive.install hex phx_new 1.4.4

# Add Elixir syntax highlighting for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/elixir-lang/vim-elixir.git ~/.vim/bundle/vim-elixir
