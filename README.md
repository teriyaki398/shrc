# zinit
plugin manager for zsh
https://github.com/zdharma/zinit

### Installation
#### Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Install zinit
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

#### Setup `enhancd`
1. install peco
some search algorithm tool is required for enhancd.
```sh
brew install peco
```

2. Install plugin via zinit normaly
Do comment out this part to install normally.
```
zinit ice \
  atclone'rm -rf conf.d; rm -rf functions; rm -f *.fish;' \
  pick'init.sh' \
  nocompile'!' \
  wait'!0'
```
After that, add above configuration and relaunch to finish setup.
