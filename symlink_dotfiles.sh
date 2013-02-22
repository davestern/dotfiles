#!/bin/bash

############################
##
############################



DOTFILES_DIRECTORY=$HOME/dotfiles

## For every file in $DOTFILES_DIRECTORY that is not a script or .md file,
## find the corresponding dotfile,
## back it up with a dated version if it's not already a symlink to 
## the dotfiles version and make the symlink

for f in `ls $DOTFILES_DIRECTORY`; do
echo $f;
done;   


