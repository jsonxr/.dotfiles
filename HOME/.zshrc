#-----------------------------------------------------------------------------
# oh-my-zsh
#-----------------------------------------------------------------------------
export ZSH_CUSTOM=$HOME/.dotfiles/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="robbyrussell"
ZSH_THEME="jason"
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git osx node)
source $ZSH/oh-my-zsh.sh
source ~/.zshrc-secrets

#-----------------------------------------------------------------------------
# Aliases
#-----------------------------------------------------------------------------

alias 'm'=mate
alias 'gp'='git pull --rebase'
alias 'll'='ls -lh'
# Make sure the pesky .DS_Store isn't included in any archives
alias 'tar'='tar --exclude=".DS_Store"'
#alias 'ls'='ls -h'

#-----------------------------------------------------------------------------
# Path
#-----------------------------------------------------------------------------
export PATH=./bin:$HOME/bin:./node_modules/.bin:$HOME/pensco/development/bin:$PATH
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

#-----------------------------------------------------------------------------
# Mongo
#-----------------------------------------------------------------------------

# Removes the following warning:
# ** WARNING: soft rlimits too low. Number of files is 256, should be at least 1000

ulimit -n 4096

#----------------------------------------------
# Oracle Driver
#----------------------------------------------
export OCI_VERSION=11
export OCI_HOME=/Users/rowlanj/pensco/scm/instantclient_11_2
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$OCI_HOME"
export OCI_LIB_DIR=$OCI_HOME
export OCI_INC_DIR=$OCI_HOME/sdk/include

#----------------------------------------------
# NVM 
# https://github.com/creationix/nvm
#----------------------------------------------
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#----------------------------------------------
# Docker
#----------------------------------------------
alias dockerclean='docker volume rm $(docker volume ls -qf dangling=true)'
alias dcimages="docker rmi $(docker images|grep '<none>'|tr -s ' '|cut -d ' ' -f 3)"
alias dc='docker-compose'
alias dm='docker-machine'
alias dcf='docker-compose -f docker-fullstack.yml'

alias run_docker_cleanup='docker run --name cleanup --rm -v /var/run/docker.sock:/var/run/docker.sock:rw  -v /var/lib/docker:/var/lib/docker:rw  -e "KEEP_IMAGES=pensco.io/node-build,mongodb" -e "LOOP=false" -e "DELAY_TIME=5" -e "CLEAN_PERIOD=60" meltwater/docker-cleanup:latest'


alias gitr='git rebase -i HEAD~2'
alias gitswap="git remote set-url origin $(git config --get remote.origin.url | sed -e 's/pensco.net/pensco.io/g')"
alias lncommon="ln -s ~/pensco/common/discovery pensco-discovery && ln -s ~/pensco/common/server pensco-server && ln -s ~/pensco/common/environment pensco-environment"

# Default virtualbox settings
export VIRTUALBOX_DISK_SIZE=50000
export VIRTUALBOX_MEMORY_SIZE=8192

# virtualbox aliases so you don't have to restart vm when switching networks
alias enable-docker-dns="docker-machine stop dev && VBoxManage modifyvm dev --natdnshostresolver1 on && docker-machine start dev"
alias disable-docker-dns="docker-machine stop dev && VBoxManage modifyvm dev --natdnshostresolver1 off && docker-machine start dev"
