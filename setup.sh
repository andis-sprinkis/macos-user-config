#!/usr/bin/env zsh
# TODO: 
# - add disable system animations commands
# - store and load iterm2:
#  - config
#  - color scheme
set -e
echo_br_bottom() { echo $1; echo; }
echo_br_top() { echo; echo $1 }
echo_br_both() { echo; echo $1; echo }
echo_fn_status() {
  if [ "$1" -eq "0" ]; then; echo_br_bottom "Function $2 started..."; fi 
  if [ "$1" -eq "1" ]; then; echo_br_bottom "Function $2 is complete!"; fi 
}
echo_script_status() {
  if [ "$1" -eq "0" ]; then; echo_br_bottom "Starting $2..."; fi 
  if [ "$1" -eq "1" ]; then; echo_br_bottom "$2 is complete!"; fi 
}

scriptname="macOS user session configuration script"
echo_script_status 0 "$scriptname"

install_brew() {
  echo_fn_status 0 $funcstack[1]

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo_fn_status 1 $funcstack[1]
}

install_cmd_programs() {
  echo_fn_status 0 $funcstack[1]

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

  echo_fn_status 1 $funcstack[1]
}

install_gui_programs() {
  echo_fn_status 0 $funcstack[1]

  brew install --cask \
    iterm2 \
    keepassxc

  echo_fn_status 1 $funcstack[1]
}

get_zsh_session_config() {
  echo_fn_status 0 $funcstack[1]

  wget --no-cache -P $HOME/ https://raw.githubusercontent.com/andis-sprinkis/linux-user-config/master/.zshrc
  if [ -f $HOME/.zshrc.1 ]; then
    rm $HOME/.zshrc
    mv $HOME/.zshrc.1 $HOME/.zshrc
  fi

  echo_fn_status 1 $funcstack[1]
}

install_node_lts() {
  echo_fn_status 0 $funcstack[1]

  mkdir -p $HOME/.nvm
  export NVM_DIR=$HOME/.nvm
  . /usr/local/opt/nvm/nvm.sh
  nvm install lts/fermium
  nvm use lts/fermium
  nvm alias default lts/fermium

  echo_fn_status 1 $funcstack[1]
}

install_node_deps() {
  echo_fn_status 0 $funcstack[1]

  npm install -G yarn
  yarn global lehre

  echo_fn_status 1 $funcstack[1]
}

get_nvim_config() {
  echo_fn_status 0 $funcstack[1]

  mkdir -p $HOME/.config
  git clone https://github.com/andis-sprinkis/neovim-user-config $HOME/.config/nvim

  echo_fn_status 1 $funcstack[1]
}

reload_zshrc() {
  echo_fn_status 0 $funcstack[1]

  . $HOME/.zshrc

  echo_fn_status 1 $funcstack[1]
}

setup() {
  install_brew
  install_cmd_programs
  install_gui_programs
  get_zsh_session_config
  install_node_lts
  install_node_deps
  get_nvim_config
  reload_zshrc
}

setup
echo_script_status 1 "$scriptname"
