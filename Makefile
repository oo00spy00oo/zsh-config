all: homebrew

.PHONY: symlink

symlink: zshrc-symlink oh-my-tmux-symlink nvim-symlink zprezto-symlink yabai-symlink skhd-symlink starship

pre-requisites: go colorize tmuxinator-completion

# Symlink
zsh-symlink:
	cd && \
	ln -s -f ${HOME}/.config/zsh-config/zsh/.zshrc && \
	ln -s -f ${HOME}/.config/zsh-config/zsh/.bash_profile && \
	ln -s -f ${HOME}/.config/zsh-config/zsh/alias/.bash_aliases && \
	ln -s -f ${HOME}/.config/zsh-config/zsh/alias/.kb_alias && \
	ln -s -f ${HOME}/.config/zsh-config/zsh/.zshenv

zprezto-symlink:
	# Default mapping from: ${HOME}/.zprezto/runcoms/zpreztorc
	cd && ln -s -f ${HOME}/.config/zsh-config/zsh/.zpreztorc

oh-my-tmux-symlink:
	# https://github.com/gpakosz/.tmux
	git submodule update --init --recursive
	git submodule sync

	cd && \
	ln -s -f ${HOME}/.config/zsh-config/.tmux/.tmux.conf && \
	ln -s -f ${HOME}/.config/zsh-config/.tmux/.tmux.conf.local

nvim-symlink:
	mkdir -p ${HOME}/.config/nvim

	cd ~/.config/nvim && \
	ln -s -f ${HOME}/.config/zsh-config/.config/nvim/configs && \
	ln -s -f ${HOME}/.config/zsh-config/.config/nvim/init.vim

yabai-symlink:
	mkdir -p ${HOME}/.config/yabai
	cd ~/.config/yabai && \
	ln -s -f ${HOME}/.config/zsh-config/.config/yabai/yabairc

skhd-symlink:
	mkdir -p ${HOME}/.config/skhd
	cd ~/.config/skhd && \
	ln -s -f ${HOME}/.config/zsh-config/.config/skhd/skhdrc

starship:
	cd ~/.config && \
	ln -s -f ${HOME}/.config/zsh-config/starship.toml

prezto-contrib:
	# https://github.com/belak/prezto-contrib#usage
	cd ${ZPREZTODIR}
	git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib

# Language
go:
	# https://medium.com/@jimkang/install-go-on-mac-with-homebrew-5fa421fc55f5
	brew install golang
	mkdir -p $HOME/go/{bin,src,pkg}
	# Setup env (in .bash_profile)

colorize:
	# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize
	# https://github.com/alecthomas/chroma
	go get -u github.com/alecthomas/chroma/cmd/chroma

tmuxinator-completion:
	# https://github.com/tmuxinator/tmuxinator
	wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator

update:
	# Submodule update from remote
	git submodule update --remote --merge