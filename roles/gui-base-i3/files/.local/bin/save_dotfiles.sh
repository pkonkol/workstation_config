#!/usr/bin/bash

ZIP_NAME=dotfiles_`date -u +"%Y-%m-%d:%H%M%S"`.zip

cd ~
zip -ur $ZIP_NAME .config/* -x .config/discord/**\*
zip -ur $ZIP_NAME .local/bin/ .themes
zip -ur $ZIP_NAME .vim* .zsh* .tmux* .bash* .X* .x* .ssh .gtkrc-2.0 .gitconfig

# mv $ZIP_NAME Documents/
