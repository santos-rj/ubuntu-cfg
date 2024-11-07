#!/bin/bash

echo "Running santos-rj-cfg, please wait for the setup to finish!"

# Atualiza pacotes e instala dependências essenciais
sudo apt update && sudo apt upgrade -y

echo "Installing curl and apt-transport-https..."
sudo apt install -y apt-transport-https curl

# Instala o Git e configurações iniciais
echo "Installing Git..."
sudo apt install -y git

echo "Enter your Git user.name (e.g., Rafael Santos):"
read -r git_config_user_name
git config --global user.name "$git_config_user_name"
clear

echo "Enter your Git user.email:"
read -r git_config_user_email
git config --global user.email "$git_config_user_email"
clear

# Configura o editor padrão do Git
echo "Can I set VIM as your default GIT editor? (y/n)"
read -r git_core_editor_to_vim
if [[ "$git_core_editor_to_vim" =~ ^[Yy]$ ]]; then
	git config --global core.editor vim
else
	echo "No problem! Moving on."
fi

# Gera a chave SSH
echo "Installing xclip..."
sudo apt-get install -y xclip

echo "Generating an SSH Key..."
ssh-keygen -t rsa -b 4096 -C "$git_config_user_email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Your SSH key has been copied to the clipboard."

# Função para instalar pacotes usando apt e snap
install_apt_package() {
	echo "Installing $1..."
	sudo apt install -y "$1"
}

install_snap_package() {
	echo "Installing $1..."
	sudo snap install "$1" "$2"
}

# Instala navegadores Brave e Chrome
echo "Installing Brave Browser..."
curl -fsSL https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/brave-browser-release.gpg
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && install_apt_package brave-browser

echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt install -f -y
rm google-chrome-stable_current_amd64.deb

# Instala outras ferramentas
install_apt_package g++
install_apt_package flameshot
install_apt_package zsh
install_apt_package terminator

echo "Installing DBeaver..."
wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb || sudo apt install -f -y
rm dbeaver-ce_latest_amd64.deb

# Instala pacotes Snap
install_snap_package spotify
install_snap_package code --classic
install_snap_package pycharm-community --classic
install_snap_package insomnia

# Instala Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Atualiza novamente para garantir tudo em dia
sudo apt update -y && sudo apt upgrade -y

echo "Setup finished! :D"
