# zoxide
eval "$(zoxide init bash)"

# Alias
alias cat='bat'
alias ls='exa'
alias cd='z'
alias du='dust'
alias df='duf'
alias find='fd'
alias grep='rg'
alias ack='ag'
alias top='btm'
alias ps='procs'
alias ping='gping'

# Completion
source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

# Prompt
export STARSHIP_CONFIG=$HOME/.dotfiles/starship/starship.toml
eval "$(starship init bash)"
