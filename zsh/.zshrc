# Variabes
ZDOTDIR=$HOME/.zsh
ADOTDIR=$ZDOTDIR/antigen

export EDITOR=nvim

# Fetch antigen
if [ ! -d $ADOTDIR ]; then
    mkdir $ADOTDIR
fi
if [ ! -f $ADOTDIR/antigen.zsh ]; then
    curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh -o $ADOTDIR/antigen.zsh
fi
source $ADOTDIR/antigen.zsh

# Libraries required from oh-my-zsh
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle ant
antigen bundle git
antigen bundle gradle
antigen bundle mvn
antigen bundle sudo
antigen bundle systemd
antigen bundle web-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting


antigen theme robbyrussell

antigen apply

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Don't make an annoying beep
unsetopt beep

# Vim-style keybindings
bindkey -v

# Fix % sign before prompts
unsetopt PROMPT_SP

# Aliases
alias vim="nvim"
alias vi="nvim"

# Colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

