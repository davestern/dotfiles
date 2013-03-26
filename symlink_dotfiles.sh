#!/bin/bash

############################
## symlink_dotfiles.sh
############################

## Symlinks each dotfiles/file that is not .md, .sh or ~
## to the corresponding ~/.file name and makes a backup
## if a regular file already exists.

DOTFILES_DIRECTORY=$HOME/dotfiles

## For every file in $DOTFILES_DIRECTORY that is not a script or .md file,
## find the corresponding dotfile,
## back it up with a dated version if it's not already a symlink to 
## the dotfiles version and make the symlink

FILES=$(ls $DOTFILES_DIRECTORY | grep --invert-match --perl-regexp '(md|sh|~)$')

for file in $FILES; do
    dotfile=~/.${file}
    ## Only continue if the dotfile is not already a symbolic link
    if [ ! -L $dotfile ]
    then

	## If the dotfile is a regular file, back it up
	if [ -f $dotfile ]
	then
	    backup=$dotfile.$(date +%Y%m%d%H%M%S)
	    echo "Backing up regular file $dotfile to $backup"
	    mv $dotfile $backup
	fi;

	ln -v -s ~/dotfiles/${file} $dotfile
    fi;
done;   


