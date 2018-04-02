# Dotfiles

## Install
```
$ git clone git@github.com:HedgehogCode/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install [arch|...]
```

## Applications

### ZSH

Install antigen:
```
mkdir -p ~/apps/antigen/
git clone git@github.com:zsh-users/antigen.git ~/apps/antigen
```

### VIM

#### Vundle

Install vundle:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Open vim and run `PluginInstall`

#### YouCompleteMe

```
cd ~/.vim/bundle/youcompleteme
./install.sh
```
