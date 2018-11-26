# ==================================================== GENERATED ==============
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
KEYTIMEOUT=1
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ==================================================== ANTIGEN ================
source ${HOME}/apps/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
	# Bundles from the default repo (robbyrussell's oh-my-zsh).
	git
	command-not-found
	colored-man-pages
	vi-mode
	history-substring-search
	tmux
	mvn
	gitignore
	vagrant

	# A nice theme
	agkozak/agkozak-zsh-theme

	# Some usefull plugins
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions

	# Alias tips
	djui/alias-tips
EOBUNDLES

# Tell Antigen that you're done.
antigen apply

# History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ==================================================== VARIABLES + ALIASES ====

# ========== Additions to the PATH
# Add my home bin folder to PATH
PATH=${HOME}/bin:${PATH}

# Source exec paths file (System dependent additions to the PATH)
EXEC_PATHS_RC=${HOME}/bin/execpathsrc
if [ -f $EXEC_PATHS_RC ]; then
	source $EXEC_PATHS_RC
fi

# Set VISUAL and EDITOR variable to vim
VISUAL=vim
EDITOR=${VISUAL}

# Add Android SDK Home
ANDROID_HOME=${HOME}/apps/android-sdk
# added by travis gem
[ -f /home/bw/.travis/travis.sh ] && source /home/bw/.travis/travis.sh

# Set the autosuggestion color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=11

# ========== Aliases
# Update all pip packages
alias pipupdate='pip install $(pip list --outdated | awk '"'"'{ print $1 }'"'"') --upgrade'

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
