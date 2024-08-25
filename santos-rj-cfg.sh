echo 'Running santos-rj-cfg, wait for the setup to finish!'

sudo apt update

echo 'installing  curl' 
sudo apt install apt-transport-https curl -y

echo 'installing git' 
sudo apt install git -y

echo "Qual usuario você usa no Git user.name"
echo "For example, mine will be \"Rafael Santos\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "Qual email você usa no Git user.email"
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo 'installing xclip'
sudo apt-get install xclip

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

echo 'installing brave'
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

echo 'installing google chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f

echo 'installing g++'
sudo apt install g++ -y

echo 'installing dbeaver'
wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo apt install -f

echo 'installing snap'
sudo apt install snapd -y

echo 'installing spotify'
sudo snap install spotify

echo 'installing VSCode'
sudo snap install code --classic

echo 'installing PyCharm'
sudo snap install pycharm-community --classic

echo 'installing Flameshot'
sudo apt install flameshot

echo 'installing Insomnia'
sudo snap install insomnia

echo 'installing Zsh'
sudo apt install zsh

echo 'installing Oh My Zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'installing terminator'
sudo apt install terminator -y

sudo apt update -y && sudo apt upgrade -y

echo 'Finished! :D'
