install_dein:
	mkdir -p .tmp
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > .tmp/installer.sh
	sh .tmp/installer.sh $$HOME/.vim/dein
	touch custom.vim
	nvim -c 'quit'

.PHONY: install_dein
