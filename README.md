# dotfiles
Personal installs and dotfiles that I like available on my machines

# install
```sh
curl -fsSL https://raw.githubusercontent.com/jsonxr/.dotfiles/master/install | sh
```

# direnv

This loads environment variables from the `.envrc` file when you enter the directory. - https://direnv.net

```sh
# .envrc
export POSTGRES_USER=jason
export POSTGRES_PASSWORD=jason
```

# jq

Command line json query tool- https://stedolan.github.io/jq/

```sh
echo '{ "hello": "world" }' | jq ".hello" -r
world
```
# node
Runs javascript files.
```sh
node script.js
```

# telnet
Useful for debugging text based protocols.
```sh
telnet localhosta 80
```

# watch
Runs a command on an interval of 1s and highliths the differences.
```sh
watch -d -n 1 docker ps
```

# wget
```sh
wget http://google.com
```

- https://blog.sebastian-daschner.com/entries/zsh-aliases
  