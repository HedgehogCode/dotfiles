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
	# zsh-users/zsh-autosuggestions

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

# Set the autosuggestion color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=11


# ========== Application shortcuts
alias lg='lazygit'
alias nv='nvim'

# ========== Aliases
# Update all pip packages
alias pipupdate='pip install $(pip list --outdated | awk '"'"'{ print $1 }'"'"') --upgrade'

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# Open a file
alias open='xdg-open >/dev/null 2>/dev/null'

# Git aliases
alias gpf='git push --force-with-lease'
alias grbim='git rebase -i $(git_main_branch)'
alias gsur='git submodule update --init --recursive'

# List size of all files in folder
alias dl='du -sh *'

# Delete all folders with a given name in the tree
alias replace_all='f() {find ./ -type f -name "$1" -exec sed -i "s/$2/$3/g" {} \; };f'


# HSTR configuration - add this to ~/.zshrc
export HISTFILE=~/.histfile
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

