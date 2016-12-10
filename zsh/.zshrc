# auto-install zplug
if [[ ! -d ~/.zplug ]]; then
  echo '[zshrc] installing zplug...'
  git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

export ZPLUG_HOME=~/.zplug

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "arzzen/calc.plugin.zsh"
zplug "supercrabtree/k"
zplug "hlissner/zsh-autopair"
zplug "plugins/dnf", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh

zplug "shashankmehta/dotfiles", \
  use:thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme, \
  as:theme

if ! zplug check --verbose; then
  zplug install
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v

export PATH=~/.cargo/bin:$PATH
export EDITOR=nvim

export RUST_SRC_PATH=~/.local/src/rust

alias vim=nvim
alias vi=nvim
alias ni=nvim
