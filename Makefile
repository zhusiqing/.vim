install_plug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
	ln -s ~/.vim/ ~/.config/nvim
.PHONY: install_plug
