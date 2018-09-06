source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joe/.gcsdk/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/joe/.gcsdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joe/.gcsdk/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/joe/.gcsdk/google-cloud-sdk/completion.zsh.inc'; fi

# Ensure gpg-agent is running and export TTY
INFO=`gpg-agent --daemon -q --sh --default-cache-ttl 28800 --enable-ssh-support --pinentry-program $(which pinentry-mac)`
if [[ $? -eq 0 ]]; then
  echo "$INFO" > "${HOME}/.gpg-agent-info"
fi
GPG_TTY=$(tty)
export GPG_TTY
. "${HOME}/.gpg-agent-info"

