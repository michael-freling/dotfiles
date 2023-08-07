install: # {install-apps # setup # fish
	sudo apt -y update && sudo apt -y install fish curl fzf
	# 	sudo chsh -s $(shell which fish)
	mkdir -p $(HOME)/.config/fish
	ln -sfn $(shell pwd)/fish/config.fish $(HOME)/.config/fish/
	ln -sfn $(shell pwd)/fish/fish_plugins $(HOME)/.config/fish/
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
	fisher update
	
	git clone https://github.com/anyenv/anyenv ~/.anyenv
	~/.anyenv/bin/anyenv init
	~/.anyenv/bin/anyenv install --init
	~/.anyenv/bin/anyenv install nodenv

	# git
	ln -sfn $(shell pwd)/.gitconfig $(HOME)/.gitconfig

	# emacs
	mkdir -p $(HOME)/.emacs.d
	ln -sf $(shell pwd)/init.el $(HOME)/.emacs.d/

	# gh
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(shell dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt update
	sudo apt install gh


install-apps:
# 	sudo snap install google-chrome

	sudo apt-add-repository ppa:fish-shell/release-3
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb	
	sudo snap install vlc
	sudo snap install --classic code

setup:
	# Set CapsLock key to Ctrl key
	# https://opensource.com/article/21/5/remap-caps-lock-key-linux
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:ctrl_modifier']"
	# Auto hide dock
	# https://askubuntu.com/questions/1005470/how-do-i-auto-hide-the-ubuntu-dock-using-gsettings-on-ubuntu-17-10-and-later
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false

