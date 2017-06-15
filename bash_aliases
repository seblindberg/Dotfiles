# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Cask
alias cask='brew cask'

# git
alias g='git'
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

# Vagrant
alias vg='vagrant'

# Quaranten
alias qattr="xattr -d com.apple.quarantine "