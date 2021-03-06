#!/bin/bash

# git clone https://github.com/edkolev/tmuxline.vim ~/.vim/bundle/tmuxline.vim

# Install my .vimrc 
if [ -f ~/.tmux.conf ]; then
	echo "   - My tmux xonfig file found"
else
	echo "   - Installing my tmux xonfig"
	ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

# Install my .vimrc 
if [ -f ~/.vimrc ]; then
	echo "   - My .vimrc found"
else
	echo "   - Installing my .vimrc file"
	ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
fi

# Install my .bashrc 
if [ -f ~/.bashrc ]; then
	echo "   - My .bashrc found"
else
	echo "   - Installing my .bashrc file"
	ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
fi

# Adding some color
if [ -d ~/.vim/colors ]; then
	echo "   - Colors directory exists, backing up..."
	tar -czvf ~/colors-backup-DATE.tgz ~/.vim/colors
	rm -fr ~/.vim/colors
	cd ~/.vim
	git clone https://github.com/jrobles/colors.git
else
	echo "   - No Colors present..."
	mkdir -p ~/.vim
	cd ~/.vim/
	git clone https://github.com/jrobles/colors.git
fi
