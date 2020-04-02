source ~/.dotfiles/.profile
touch ~/.profile-secrets
source ~/.profile-secrets
for file in ~/.dotfiles/*/source.sh; do
  source $file
done
