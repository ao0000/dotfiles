# alias
alias cat='bat'
alias ls='exa'
alias cd='z'
alias du='dust'
alias df='duf'
alias find='fd'
alias grep='ripgrep'
alias ack='ag'
alias top='btm'
alias ps='procs'
alias ping='gping'

# broot
source $HOME/.config/broot/launcher/bash/br
# fzf
source ~/.fzf.bash
# zoxide
eval "$(zoxide init bash)"

# Prompt
export STARSHIP_CONFIG=$HOME/.dotfiles/starship/starship.toml
eval "$(starship init bash)"
