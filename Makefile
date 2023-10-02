install: # {install-apps # setup # fish
	sudo apt -y update && sudo apt -y install fish curl fzf jq
	# 	sudo chsh -s $(shell which fish)
	mkdir -p $(HOME)/.config/fish
	ln -sfn $(shell pwd)/fish/config.fish $(HOME)/.config/fish/
	ln -sfn $(shell pwd)/fish/fish_plugins $(HOME)/.config/fish/
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
	fish -c "fisher update"
	
	# git
	ln -sfn $(shell pwd)/.gitconfig $(HOME)/.gitconfig

	# tmux
	ln -sfn $(shell pwd)/.tmux.conf $(HOME)/.tmux.conf

	make install-google-cloud-sdk
	make install-firebase-cli
	make install-gh
	make install-anyenv
	make install-bitwarden-cli

install-apps:
# 	sudo snap install google-chrome

	sudo apt-add-repository ppa:fish-shell/release-3
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb	
	sudo snap install vlc
	sudo snap install --classic code

install-gh:
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(shell dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt update
	sudo apt install gh

install-bitwarden-cli:
	# https://bitwarden.com/help/cli/
	npm install -g @bitwarden/cli
	npx bw login

install-anyenv:
	git clone https://github.com/anyenv/anyenv ~/.anyenv
	~/.anyenv/bin/anyenv init
	~/.anyenv/bin/anyenv install --init
	~/.anyenv/bin/anyenv install nodenv
	~/.anyenv/bin/anyenv install tfenv

install-google-cloud-sdk:
	sudo apt -y update
	sudo apt -y install apt-transport-https ca-certificates gnupg curl sudo
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
	sudo apt -y update && sudo apt -y install google-cloud-cli
	gcloud init

install-firebase-cli:
	curl -sL https://firebase.tools | bash
	firebase login

setup:
	# Set CapsLock key to Ctrl key
	# https://opensource.com/article/21/5/remap-caps-lock-key-linux
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:ctrl_modifier']"
	# Auto hide dock
	# https://askubuntu.com/questions/1005470/how-do-i-auto-hide-the-ubuntu-dock-using-gsettings-on-ubuntu-17-10-and-later
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
