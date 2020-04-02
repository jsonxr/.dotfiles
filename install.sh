source functions.sh

install brew "curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | sh"
install telnet "brew install telnet"
install jq "brew install jq"
install node "brew install node"
install wget "brew install wget"
install watch "brew install watch"

# ------------------------------------------------------------------------------
# Install things in folders
# ------------------------------------------------------------------------------
for file in ~/.dotfiles/*/install.sh; do
  eval $file
done
