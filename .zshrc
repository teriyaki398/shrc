# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "plugins/git", from:oh-my-zsh   # git のエイリアス設定
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "b4b4r07/enhancd", use:init.sh  # enhancd
ENHANCD_HOOK_AFTER_CD="ls -lG"

# Simple Theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load


# Basic Settings
setopt no_beep    # beep disable
setopt ignore_eof # prevent stop zsh with Ctrl+D 
autoload -Uz select-word-style  # auto completion setting 
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|" # / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-style unspecified
autoload -Uz compinit　# 補完機能
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'　# 補完で小文字でも大文字にマッチさせる
## ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
## 日本語使用
export LANG=ja_JP.UTF-8


# Alias
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -G"
alias ll="ls -l"

## VSCode
alias vscode="open -a Visual\ Studio\ Code"



# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# # Alias 設定
# ########################################
# # OS 別の設定
# case ${OSTYPE} in
#     darwin*)
#         #Mac用の設定
#         export CLICOLOR=1
#         alias ls='ls -G -F'
#         ;;
#     linux*)
#         #Linux用の設定
#         alias ls='ls -F --color=auto'
#         ;;
# esac

# # cd したら ls する
# cdls ()
# {
#     \cd "$@" && ls
# }

