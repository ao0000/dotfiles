

function setup_gcc(){
    # gcc
    brew install gcc
    sudo ln -s $(brew --prefix)/bin/gcc-13 /usr/local/bin/gcc
    sudo ln -s $(brew --prefix)/bin/g++-13 /usr/local/bin/g++
}

function setup_python(){
    # python
    asdf plugin-add python
    asdf install python latest
    asdf global python latest
}

function setup_go(){
    # golang
    asdf plugin-add golang
    asdf install golang latest
    asdf global golang latest

    # golangci-lint
    asdf plugin-add golangci-lint
    asdf install golangci-lint latest
    asdf global golangci-lint latest
}

function setup_rust(){
    # rust
    asdf plugin-add rust
    asdf install rust latest
    asdf global rust latest
}

function setup_node(){
    # nodejs
    asdf plugin-add nodejs
    asdf install nodejs latest
    asdf global nodejs latest

    # yarn
    npm install --global yarn
}

function main(){
    setup_gcc

    setup_python

    setup_go

    setup_rust

    setup_node
}

main