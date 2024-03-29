export DOTFILES=${DOTFILES:-"$HOME/.dotfiles"}

. $DOTFILES/pre.sh

export ZPLUG_HOME=`brew --prefix zplug`
source $ZPLUG_HOME/init.zsh 

zplug "rupa/z", use:z.sh
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "b4b4r07/enhancd", use:init.sh
zplug "lukechilds/zsh-nvm"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3


if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

. $DOTFILES/extensions/source.sh
. $DOTFILES/theme.sh

setopt prompt_subst
set -o vi

zplug load

. $DOTFILES/post.sh

if [ -z "$TMUX" ]; then tmux; fi 

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
