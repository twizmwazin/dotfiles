if ! [ -d ~/.zplug ]; then
    curl https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "chriskempson/base16-shell", \
    use:"scripts/base16-tomorrow-night.sh", \
    as:theme

if ! zplug check --verbose; then
    zplug install
fi
zplug load

export EDITOR=nvim
export PATH=$PATH:~/.local/bin:~/.cargo/bin:~/workspace/go/bin
export GOPATH=~/workspace/go

alias vim=nvim

alias nvimedit="$EDITOR ~/.config/nvim/init.vim"
alias zshedit="$EDITOR ~/.zshrc"
