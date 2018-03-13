# ==================================================== GENERATED ==============
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
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
source ${HOME}/.antigenrc

# ==================================================== VARIABLES + ALIASES ====

# ========== Additions to the PATH
# Add my home bin folder to PATH
PATH=${HOME}/bin:${PATH}

# Source exec paths file (System dependent additions to the PATH)
EXEC_PATHS_RC=${HOME}/bin/execpathsrc
if [ -f $EXEC_PATHS_RC ]; then
	source $EXEC_PATHS_RC
fi

# TODO Remove and add to execpathrc / Add ruby gem to PATH
PATH=${HOME}/.gem/ruby/2.5.0/bin:${PATH}

# Set VISUAL and EDITOR variable to vim
VISUAL=vim
EDITOR=${VISUAL}

# Add Android SDK Home
ANDROID_HOME=${HOME}/apps/android-sdk
# added by travis gem
[ -f /home/bw/.travis/travis.sh ] && source /home/bw/.travis/travis.sh

# ========== Aliases
# Update all pip packages
alias pipupdate='pip install $(pip list --outdated | awk '"'"'{ print $1 }'"'"') --upgrade'

