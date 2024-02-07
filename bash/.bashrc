# prompt
eval "$(starship init bash)"

# alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias cat='bat'
alias ls='exa --icons'
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
alias gc='git commit'
alias gd='git diff'
alias gb='git branch'
alias gch='git checkout'
alias gp='git push'
alias gf='git fetch'
alias gs='git status'
alias gl='git logg'

# docker
alias d='docker'

# zoxide
eval "$(zoxide init bash)"
alias cd='z'

# Completion
source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

# Intellij
export PATH=$PATH:$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts

# go
export PATH=$PATH:$(go env GOPATH)/bin