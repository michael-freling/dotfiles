install: # {install-apps # setup # fish
	# git
	ln -sfn $(shell pwd)/.gitconfig $(HOME)/.gitconfig

	make install-firebase-cli
	make install-bitwarden-cli

install-apps:
# 	sudo snap install google-chrome

	sudo apt-add-repository ppa:fish-shell/release-3
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	sudo snap install vlc

install-bitwarden-cli:
	# https://bitwarden.com/help/cli/
	npm install -g @bitwarden/cli
	npx bw login

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
