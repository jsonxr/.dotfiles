# dotfiles
Personal installs and dotfiles that I like available on my machines

# install
```sh
curl -fsSL https://raw.githubusercontent.com/jsonxr/.dotfiles/master/install | sh
```
# Commands

The following commands are installed by this script.

## direnv

This loads environment variables from the `.envrc` file when you enter the directory. - https://direnv.net

```sh
brew install direnv

# .envrc
export POSTGRES_USER=jason
export POSTGRES_PASSWORD=jason
```

## jq

Command line json query tool- https://stedolan.github.io/jq/

```sh
brew install jq
echo '{ "hello": "world" }' | jq ".hello" -r
world
```
## node
Runs javascript files.
```sh
brew install node
echo "console.log('Hello World');" > script.js
node script.js
```

## telnet
Useful for debugging text based protocols.
```sh
brew install telnet
telnet localhosta 80
```

## watch
Runs a command on an interval of 1s and highliths the differences.
```sh
brew install watch
watch -d -n 1 docker ps
```

## wget
```sh
brew install wget
wget http://google.com
```

- https://blog.sebastian-daschner.com/entries/zsh-aliases
  
