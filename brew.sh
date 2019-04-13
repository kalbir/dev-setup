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

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion@2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# A note on programming languages.
# Wherever possible I am maintaining programming languages through asdf (https://github.com/asdf-vm/asdf)
brew install asdf

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep --with-default-names # --with-default-names overrides system grep
brew install openssh
brew install screen
brew install curl

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install tcptrace

# Install other useful binaries.
brew install ack
brew install automake
brew install cmake
brew install git
brew install git-lfs
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install jq
brew install kubectl
brew install lynx
brew install p7zip
brew install pandoc
brew install pkg-config libffi
brew install pv
brew install rename
brew install rhino
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku-toolbelt
heroku update

# Install Cask
brew tap caskroom/cask
brew install brew-cask-completion
brew tap caskroom/versions

# Things that make my machine work
brew cask install alfred
brew cask install flux
brew cask install vlc
# utorrent - the name in cask is bittorrent
brew cask install bittorrent
brew cask install caffeine
brew cask install spotify
brew cask install helium
brew cask install skype
brew cask install skype-for-business
brew cask install slack
brew cask install dropbox
brew cask install mou
brew cask install simplenote
brew cask install gimp
# rocket - universal emoji picker (http://matthewpalmer.net/rocket/)
brew cask install rocket
# franz - connect to multiple chat systems
brew cask install franz
brew cask install disk-inventory-x
# itsycal - small calendar for the taskbar clock
brew cask install itsycal
brew cask install tunnelblick
brew cask install keybase
brew cask install backblaze
brew cask install avast-security
brew cask install nordvpn
brew cask install monodraw
brew install caskroom/cask/muzzle

# Some google tools
brew cask install google-photos-backup-and-sync
brew cask install google-drive-file-stream

# Development tool casks
brew cask install iterm2
brew cask install atom
brew cask install virtualbox # this didn't work
brew cask install heroku-toolbelt
# Install docker for mac rather than docker machine
brew cask install docker

# Web browsers
brew cask install google-chrome
brew cask install firefox
brew cask install brave

# LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Development tools
# ghi - command line tool for github issues
brew install ghi
brew install ansible
brew install awscli

# Install some databases
brew install memcached
brew install mysql
brew install mongodb
brew install sqlite
brew cask install postgres

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install webpquicklook
brew cask install suspicious-package

# Some better versions of tools. From: https://remysharp.com/2018/08/23/cli-improved
brew install fzf
brew install htop
brew install tldr
brew install bat

# Remove outdated versions from the cellar.
brew cask cleanup
brew cleanup
