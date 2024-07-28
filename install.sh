#! /usr/bin/env bash

DOTFILES_HEADER='
       _           _      __   _   _              
    __| |   ___   | |_   / _| (_) | |   ___   ___ 
   / _` |  / _ \  | __| | |_  | | | |  / _ \ / __|
  | (_| | | (_) | | |_  |  _| | | | | |  __/ \__ \
   \__,_|  \___/   \__| |_|   |_| |_|  \___| |___/
  
'

DOTFILES_PATH=$HOME/dotfiles
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
    echo "Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Your CPU architecture is not supported."
  fi
}

function install_homebrew_package(){
  casks=(
    visual-studio-code
    docker
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
    font-hack-nerd-font
    git-secrets
    docker-clean
    bat
    eza
    git-delta
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
    ripgrep
    dog
    kubectl
    kind
    krew
    yq
    kustomize
    helm
    skaffold
    asdf
    mysql-client
    redis
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
  ln -sf $DOTFILES_PATH/git/.gitignore_global $HOME/.gitignore_global

  # tmux
  ln -sf $DOTFILES_PATH/tmux/.tmux.conf $HOME/.tmux.conf
  
  # prompt
  ln -sf $DOTFILES_PATH/starship/starship.toml $HOME/.config/starship.toml

  # hide last login message on OSX
  touch $HOME/.hushlogin
}

function main(){
  echo "${DOTFILES_HEADER}"

  download_dotfiles

  install_homebrew

  install_homebrew_package

  create_symbolic

  echo 'dotfiles has finished to execute'
}

main
