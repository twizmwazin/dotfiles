all: git nvim zsh pkg-cli pkg-gui env-c env-go env-java env-latex env-rust

git:
	ln -vf ${PWD}/gitconfig ${HOME}/.gitconfig

nvim:
	mkdir -p ${HOME}/.config/nvim
	ln -vf ${PWD}/config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	nvim +PlugInstall +qa

zsh:
	ln -vf ${PWD}/zshrc ${HOME}/.zshrc
	zsh <<EOF

pkg-cli:
	sudo dnf install -y git htop neovim python2-neovim python3-neovim \
		python3-jedi subversion tmux zsh

pkg-gui:
	sudo dnf config-manager \
		--add-repo=https://negativo17.org/repos/fedora-multimedia.repo
	sudo dnf install -y dnf-plugins-core
	sudo dnf copr enable -y dirkdavidis/papirus-icon-theme
	sudo dnf install -y arc-theme ffmpeg flatpak \
		gnome-shell-extension-media-player-indicator gnome-tweak-tool \
		keepassxc levien-inconsolata-fonts mozilla-openh264 \
		nautilus-open-terminal papirus-icon-theme powertop x264
	flatpak remote-add --if-not-exists flathub \
		https://flathub.org/repo/flathub.flatpakrepo
	flatpak install -y flathub com.spotify.Client
	flatpak install -y flathub com.valvesoftware.Steam
	flatpak install -y flathub org.gtk.Gtk3theme.Arc-Darker
	flatpak install -y --from \
		https://jgrulich.fedorapeople.org/telegram/telegram.flatpakref || true
	sudo systemctl enable powertop
	sudo systemctl start powertop

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

env-rust:
	curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable \
		--no-modify-path
	rustup component add rust-src
	cargo install --force racer


.PHONY: all git nvim zsh pkg-cli pkg-gui env-c env-go env-java env-latex \
	env-rust
