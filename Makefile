install: install-apps
	# fish
	sudo apt -y install fish curl
	sudo chsh -s $(shell which fish)
	mkdir -p $(HOME)/.config/fish
	ln -sfn ./fish/config.fish $(HOME)/.config/fish/
	ln -sfn ./fish/fish_plugins $(HOME)/.config/fish/
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

	# git
	ln -sfn $(shell pwd)/.gitconfig $(HOME)/.gitconfig

	# emacs
	mkdir $(HOME)/.emacs.d
	ln -sf $(shell pwd)/init.el $(HOME)/.emacs.d/

install-apps:
# 	sudo snap install google-chrome

	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb	
	sudo snap install vlc
	sudo snap install --classic code

