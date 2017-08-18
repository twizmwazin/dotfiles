all: git nvim zsh pkg-cli pkg-gui pkg-games env-c env-go env-java \
	env-latex env-python env-rust

.PHONY: all git nvim zsh pkg-cli pkg-gui pkg-games pkg-mm env-c env-go \
	env-java env-latex env-python env-rust

git:
	ln -vf ${PWD}/gitconfig ${HOME}/.gitconfig

nvim:
	mkdir -p ${HOME}/.config/nvim
	ln -vf ${PWD}/config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	nvim +PlugInstall +qa

zsh:
	ln -vf ${PWD}/zshrc ${HOME}/.zshrc
	chsh -s /usr/bin/zsh

pkg-cli:
	sudo dnf install -y git htop neovim python2-neovim python3-neovim \
		python3-jedi sqlite subversion tmux zsh

pkg-gui:
	sudo dnf config-manager \
		--add-repo=https://negativo17.org/repos/fedora-multimedia.repo
	sudo dnf install -y dnf-plugins-core
	sudo dnf copr enable -y dirkdavidis/papirus-icon-theme || true
	sudo dnf install -y papirus-icon-theme || true
	sudo dnf install -y arc-theme dconf-editor ffmpeg flatpak \
		gnome-shell-extension-media-player-indicator icedtea-web \
		gnome-shell-extension-topicons-plus gnome-tweak-tool \
		keepassxc levien-inconsolata-fonts mozilla-openh264 mumble \
		nautilus-open-terminal nextcloud-client nextcloud-client-nautilus \
		powertop util-linux-user x264
	flatpak remote-add --if-not-exists flathub \
		https://flathub.org/repo/flathub.flatpakrepo
	flatpak install -y flathub com.spotify.Client
	flatpak install -y flathub org.gtk.Gtk3theme.Arc-Darker
	flatpak install -y --from \
		https://jgrulich.fedorapeople.org/telegram/telegram.flatpakref || true
	sudo systemctl enable powertop
	sudo systemctl start powertop

pkg-games:
	flatpak install -y flathub com.valvesoftware.Steam
	curl -o /tmp/multimc.tar.gz \
		https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz
	tar -xzvf /tmp/multimc.tar.gz -C ${HOME}
	mv ${HOME}/MultiMC ${HOME}/.multimc
	ln -vf ${PWD}/local/share/applications/minecraft.desktop \
		${HOME}/.local/share/applications/minecraft.desktop

pkg-mm:
	mkdir -p ${HOME}/.local/share/gnome-shell/extensions
	git clone https://github.com/spin83/multi-monitors-add-on.git /tmp/mm
	cp -r /tmp/mm/multi-monitors-add-on@spin83 \
		${HOME}/.local/share/gnome-shell/extensions

env-c:
	sudo dnf install -y clang gcc gcc-c++

env-go:
	sudo dnf -y install golang
	mkdir -p ${HOME}/workspace/go
	GOPATH=${HOME}/workspace/go go get -u github.com/nsf/gocode

env-java:
	sudo dnf install -y java-1.8.0-openjdk-devel maven gradle

env-latex:
	sudo dnf install -y texlive-scheme-small

env-python:
	pip2 install --user python-language-server
	pip3 install --user python-language-server

env-rust:
	curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable \
		--no-modify-path
	rustup component add rust-src
	cargo install --force racer

