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

# Add ruby gem to PATH
PATH=${HOME}/.gem/ruby/2.4.0/bin:${PATH}

# Set VISUAL and EDITOR variable to vim
VISUAL=vim
EDITOR=${VISUAL}

# added by travis gem
[ -f /home/bw/.travis/travis.sh ] && source /home/bw/.travis/travis.sh
