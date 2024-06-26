#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# General
brew install zsh;
brew install iterm2;
brew install tree;
brew install gh;

# Java
brew install openjdk@11;

# Dotfile manager
brew install chezmoi;

# Env management
brew install pyenv;
brew install tfenv;

# Code
brew install --cask pycharm-ce;
brew install --cask visual-studio-code;

# Container
brew install --cask docker;
# brew install helm;

# Browsers
brew cask install google-chrome;

# Convenience
brew install --cask bettertouchtool;
brew install --cask 1password

# Communications
brew install --cask slack
brew install --cask microsoft-outlook
brew install --cask microsoft-teams

# switch shell to zsh
which zsh
chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fonts for custom oh-my-zsh theme
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "---"
echo "go to iTerm2 > Preferences > Profiles > Colors"
echo "setup color presets to PASTEL"
echo "go to > Text and select a Powerline font (Cousine)"
echo "---"

# configure dotfiles
chezmoi init --apply shmbrg
echo "chezmoi applied"

# configure oh-my-zsh installation
cd 
USER=id -un
echo "export ZSH="/Users/$USER/.oh-my-zsh"" >> .zshrc
source $HOME/.zshrc
echo "ATTENTION - remove old path to oh-my-zsh installation in .zshrc"

# install zsh-autosuggestions (ZSH defined in .zshrc)
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins

