# git の色設定
PROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle 'vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# 色を使用出来るようにする
autoload -Uz colors
colors


# 日本語使用
export LANG=ja_JP.UTF-8


# beep を無効化
setopt no_beep

# Ctrl+D でzsh を終了しない
setopt ignore_eof


# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "


# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


# 補完機能
autoload -Uz compinit
compinit
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# rm * で確認してくれる機能を無効化
setopt RM_STAR_SILENT


# Alias 設定
########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# vim:set ft=zsh:
alias ll='ls -1'

alias vscode='open -a Visual\ Studio\ Code'
alias drive='cd /Volumes/GoogleDrive/マイドライブ'
########################################


# Google検索
google(){
  local search="https://www.google.co.jp/search?q=${*// /+}"
  local app="Google Chrome.app"
  open "${search}" -a "$app"
}


# PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# enhancd
# これを使うにはpercol などのツールが必要
# https://github.com/mooz/percol#installation
source ~/.enhancd/init.sh
ENHANCD_HOOK_AFTER_CD=ls
