#!/usr/bin/env zsh

# TODO: 
# - add disable system animations commands
# - store and load iterm2:
#  - config
#  - color scheme

set -e

install-brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
}

install-cmd-programs() {
  brew install \
    wget \
    brew \
    bat \
    tree \
    coreutils \
    findutils \
    gnu-tar \
    gnu-sed \
    gawk \
    gnutls \
    gnu-indent \
    gnu-getopt \
    grep \
    ripgrep \
    lf \
    fzf \
    zsh-syntax-highlighting \
    git \
    neovim \
    nvm \
    atool \
    tldr
}

install-gui-programs() {
  brew install --cask \
    iterm2 \
    keepassxc
}

get-zsh-session-config() {
  wget --no-cache -P $HOME/ https://raw.githubusercontent.com/andis-sprinkis/linux-user-config/master/.zshrc
  if [ -f $HOME/.zshrc.1 ]; then
    rm $HOME/.zshrc
    mv $HOME/.zshrc.1 $HOME/.zshrc
  fi
  . $HOME/.zshrc
}

install-nodejs() {
  nvm install --lts
  nvm use --lts
  nvm alias default lts
  . $HOME/.zshrc
}

install-nodejs-deps() {
  npm install -G yarn
  yarn global lehre
}

get-nvim-config() {
  mkdir -p $HOME/.config
  git clone git@github.com:andis-sprinkis/neovim-user-config.git $HOME/.config/nvim
  . $HOME/.zshrc
}

install-brew
install-cmd-programs
install-gui-programs
get-zsh-session-config
install-nodejs
install-nodejs-deps
get-nvim-config
