install:
	# fish
	sudo chsh -s $(shell which fish)
	mkdir -p $(HOME)/.config/fish
	ln -sfn ./fish/config.fish $(HOME)/.config/fish/
	ln -sfn ./fish/fish_plugins $(HOME)/.config/fish/
	curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

	# git
	ln -sfn ./.gitconfig $(HOME)/.gitconfig

	# emacs
	ln -sf ./init.el $(HOME)/.emacs.d/