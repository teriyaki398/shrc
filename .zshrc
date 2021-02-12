### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


## Custom prompt setup
setopt promptsubst

## git snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided up to this moment

## theme
zinit light sindresorhus/pure

## useful plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit ice \
  atclone'rm -rf conf.d; rm -rf functions; rm -f *.fish;' \
  pick'init.sh' \
  nocompile'!' \
  wait'!0' 
zinit light b4b4r07/enhancd 
ENHANCD_COMMAND="wd"
ENHANCD_HOOK_AFTER_CD="ls -lG"

## Custom Alias
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -G"
alias ll="ls -lh"
alias lll="ll -a"

## ls after cd
cdls ()
{
    \cd "$@" && ll
}
alias cd=cdls

## cat with colored specific word
colorcat()
{
    cat $1 | grep --color -iE "$2|$"
}
alias ccat=colorcat

alias vscode="open -a Visual\ Studio\ Code"