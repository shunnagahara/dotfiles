# starship config
eval "$(starship init zsh)"

# enhancd config
if [ -f $(echo $DOT_DIR)/enhancd/init.sh ]; then
    source $(echo $DOT_DIR)/enhancd/init.sh
fi

# normal alias
alias ll='exa -la'
alias etree='exa -l --tree'
alias gcd='cd $(echo $WORK_DIR)/$(ghq list | peco)'
alias wcd='cd $(echo $WORK_DIR)'
alias mr='hlb browse merge-requests'
alias fs='code -n $(fd -t f | peco)'
alias ds='cd $(fd -t d | peco)'
alias c='clear'
alias op='open .'
alias vs='code ./'
alias dc='docker-compose'
alias viz='vi ~/.zshrc'
alias vienv='vi ~/.zshenv'
alias sz='source ~/.zshrc'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

# git alias
alias gcheck='git checkout $(git branch | peco)'
alias gpush='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gmake='git checkout -b'
alias gdelete='git branch -D $(git branch | peco)'
alias glist='git branch'
alias gpull='git pull'
alias gmerge='git merge --no-ff'

# environment dependent alias
alias myr='cd $(echo $WORK_DIR)/133.242.224.151/linkmap/refer'

# functions
gcheckr() {
  git branch -a --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/###' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
}

function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

zle -N peco-select-history
bindkey '^R' peco-select-history

# my profile
cat $(echo $DOT_DIR)/ansize/tuba.ascii
