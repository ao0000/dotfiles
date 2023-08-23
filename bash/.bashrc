# Prompt
export STARSHIP_CONFIG=$HOME/.dotfiles/starship/starship.toml
eval "$(starship init bash)"

# Alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias cat='bat'
alias ls='exa'
alias du='dust'
alias df='duf'
alias find='fd'
alias grep='rg'
alias ack='ag'
alias top='btm'
alias ps='procs'
alias ping='gping'
alias h='tldr'
alias hc='cheat'

# git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gch='git checkout'
alias gf='git fetch'
alias gc='git commit'

# docker
alias d='docker'

# zoxide
eval "$(zoxide init bash)"
alias cd='z'
