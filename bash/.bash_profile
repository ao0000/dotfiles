# Disable warning statement about shell on Macbook
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Completion
source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

# asdf
source $(brew --prefix)/opt/asdf/libexec/asdf.sh
source $(brew --prefix)/opt/asdf/etc/bash_completion.d/asdf.bash

# Load ~/.bashrc
if [ -f ~/.bashrc ]; then
    source $HOME/.bashrc
fi