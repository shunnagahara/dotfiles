#!/bin/bash

echo "###############################################"
echo "APPS INSTALL START!"
echo "###############################################"

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    openssl
    z
    colordiff
    cask
    ansible
    peco
    hub
    tig
    node
    python3
    go
    "php@7.3"
    mysql
    postgresql
    httpd22
    ricty
    composer
    markdown
    starship
    exa
    bat
    fd
    ripgrep
    ghq
    hlb
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font
brew tap motemen/ghq
brew tap mpppk/mpppk

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    dropbox
    evernote
    adobe-acrobat-reader
    google-chrome
    google-japanese-ime
    slack
    alfred
    iterm2
    virtualbox
    vagrant
    vagrant-manager
    docker
    visual-studio-code
    clipy
    day-o
    sequel-pro
    sourcetree
    postman
    spectacle
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

chsh -s $(which zsh)
echo 'default shell zsh changed...'

cat << END

**************************************************
APPS INSTALLED bye.
**************************************************

END
