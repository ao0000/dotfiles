#! /usr/bin/env bash

DOTFILES_HEADER='
       _           _      __   _   _              
    __| |   ___   | |_   / _| (_) | |   ___   ___ 
   / _` |  / _ \  | __| | |_  | | | |  / _ \ / __|
  | (_| | | (_) | | |_  |  _| | | | | |  __/ \__ \
   \__,_|  \___/   \__| |_|   |_| |_|  \___| |___/
  
'

DOTFILES_PATH=$HOME/.dotfiles
DOTFILES_GITHUB_URL="https://github.com/ao0000/dotfiles.git"

function download_dotfiles(){
  if [ -d "$DOTFILES_PATH" ]; then
    echo "failed to download_dotfiles: $DOTFILES_PATH is already exists"
    exit 1
  fi

  echo "Download dotfiles..."
  git clone $DOTFILES_GITHUB_URL $DOTFILES_PATH
}

# Install Homebrew
function install_homebrew() {
  CPU_ARCH="$(uname -m)"
  if [ ${CPU_ARCH} == "arm64" ]; then
    echo "Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Setup Homebrew on arm64..."
    test -e /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ ${CPU_ARCH} == "x86_64" ]; then
    # TODO: support x86_64
    echo "x86_64 is not supported"
  else
    echo "Your CPU architecture is not supported."
  fi
}

function install_homebrew_package(){
  casks=(
    font-hack-nerd-font
    visual-studio-code
    docker
    sequel-ace
    postman
    google-chrome
    google-japanese-ime
    slack
    zoom
    discord
    bitwarden
    clipy
  )
  for cask in ${casks[@]}; do
    brew install --cask $cask
  done

  packages=(
    git
    bash
    bash-completion
    tmux
    vim
    starship
    git-secrets
    docker-clean
    bat
    exa
    delta
    dust
    duf
    broot
    fd
    the_silver_searcher
    fzf
    jq
    cheat
    tldr
    zoxide
    bottom
    procs
    gping
    httpie
    dog
  )
  for package in ${packages[@]}; do
    brew install $package
  done
}

function create_symbolic(){
  # bash
  ln -sf $DOTFILES_PATH/bash/.bashrc $HOME/.bashrc
  ln -sf $DOTFILES_PATH/bash/.bash_profile $HOME/.bash_profile

  # vim
  ln -sf $DOTFILES_PATH/vim/.vimrc $HOME/.vimrc

  # git
  ln -sf $DOTFILES_PATH/git/.gitconfig $HOME/.gitconfig
}

function setup_git(){
  if [ ! -d "$HOME/.config/git" ]; then
    mkdir $HOME/.config/git
  fi
  cp $DOTFILES_PATH/git/.gitconfig/.gitignore_global $HOME/.config/git/ignore
}

function setup_osx_terminal(){
  # Disable last login message on osx terminal
  touch $HOME/.hushlogin
}

function reload_shell(){
  . $HOME/.bashrc
  . $HOME/.bash_profile
}

function main(){
  echo "${DOTFILES_HEADER}"

  download_dotfiles

  install_homebrew

  install_homebrew_package

  create_symbolic

  setup_osx_terminal

  reload_shell
}

main
