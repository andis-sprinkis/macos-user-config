# macOS user environment setup

## Setup process

1. Install and activate Homebrew.
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   eval $(/opt/homebrew/bin/brew shellenv)
   ```
1. Clone the configuration setup repository and change the directory to it.
   ```sh
   git clone https://github.com/andis-sprinkis/macos-user-config $HOME/macos-user-config
   cd $HOME/macos-user-config
   ```
1. Install the Homebrew packages.
   ```sh
   [ -s ./pkg_brew_tap ] && brew tap $(echo $(cat ./pkg_brew_tap))
   [ -s ./pkg_brew ] && brew install $(echo $(cat ./pkg_brew))
   [ -s ./pkg_brew_cask ] && brew install --cask $(echo $(cat ./pkg_brew_cask))
   ```
1. Install user general configuration.
   ```sh
   git_url_cfg=https://github.com/andis-sprinkis/nix-user-config
   dir_cfg_git=$HOME/.dotfiles_git
   temp_path=$(mktemp -d)
   git clone --separate-git-dir=$dir_cfg_git $git_url_cfg $temp_path
   rsync --recursive --verbose --exclude '.git' $temp_path/ $HOME
   git --git-dir=$dir_cfg_git --work-tree=$HOME config --local status.showUntrackedFiles no
   git --git-dir=$dir_cfg_git --work-tree=$HOME submodule update --init
   ```
1. Install npm packages.
   ```sh
   export VOLTA_HOME="$HOME/.local/share/volta"
   PATH="$VOLTA_HOME/bin:$PATH"
   cd $HOME/macos-user-config
   [ -s ./pkg_npm ] && volta install $(echo $(cat ./pkg_npm))
   ```
1. Install user Neovim configuration.
   ```sh
   cd $HOME/.config
   git clone https://github.com/andis-sprinkis/nvim-user-config nvim
   ```
