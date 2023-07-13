# Disable warning statement about shell on Macbook
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Completion
source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

# Load ~/.bashrc
if [ -f ~/.bashrc ]; then
    source $HOME/.bashrc
fi