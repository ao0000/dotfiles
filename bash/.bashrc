# zoxide
eval "$(zoxide init bash)"

# Alias
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

# Prompt
export STARSHIP_CONFIG=$HOME/.dotfiles/starship/starship.toml
eval "$(starship init bash)"
