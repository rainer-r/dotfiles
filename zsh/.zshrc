# Completion System
autoload -Uz compinit

# Add zsh-completions to fpath
fpath=("$ZDOTDIR/plugins/zsh-completions/src" $fpath)

# Check if .zcompdump is older than 24 hours
setopt local_options extended_glob
local zcompdump="$ZDOTDIR/.zcompdump"
if [[ ! -f "$zcompdump" || -n "$zcompdump"(#qNmh+24) ]]; then
  # Regenerate if missing or old
  compinit -d "$zcompdump"
else
  # Skip check if recent
  compinit -C -d "$zcompdump"
fi


# History Configurations
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY           # Share history between sessions
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
setopt HIST_VERIFY             # Show command with history expansion before running


# Correction
setopt CORRECT # Spelling correction for commands


# Bell Sounds
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP


# Environment Variables (sourced from env.d/)
for file in "$ZDOTDIR"/env.d/*.zsh; do
  [ -r "$file" ] && source "$file"
done
unset file


# Shell Integrations
eval "$(starship init zsh)" # Prompt style
eval "$(zoxide init zsh)" # cd improved
source <(fzf --zsh) # file search improved


# Plugins
# zsh-autosuggestions: To Use: Press "-->" key to accept
if [ -f "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# zsh-completions: located at "Completion System"

# zsh-syntax-highlighting 
if [ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi


# Keybindings
bindkey '^I' autosuggest-accept		# Tab instead of arrow
bindkey '^ ' expand-or-complete		# Completion menu
bindkey '\ek' up-line-or-search		# Up in history
bindkey '\ej' down-line-or-search	# Down in history


# Aliases
alias c='clear'
alias ll='eza --icons --no-user -la'
alias lt='eza --icons --tree -a'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias bat='bat -p'
alias cat='bat -p'

alias fixzsh="~/scripts/fixzsh.sh"


# Gemini
# export GEMINI_API_KEY="AIzaSyBie3Myri43XiR-f1IG8DNHfI2Fc_z22eI"
# alias gemini='gemini --ignore-file ~/.config/gemini/ignore'
export GEMINI_SYSTEM_MD="$HOME/.gemini/system.md"
export GEMINI_SANDBOX=true
export GOOGLE_CLOUD_PROJECT="geminicli-494006"
export SANDBOX_FLAGS="--add-host=host.docker.internal:host-gateway"

# for gem cli
unset GIT_CONFIG_GLOBAL

# Paths
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.duckdb/cli/latest:$PATH


# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rainer/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rainer/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rainer/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rainer/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

