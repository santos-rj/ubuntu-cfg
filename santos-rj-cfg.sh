echo 'Running santos-rj-cfg, wait for the setup to finish!'

sudo apt update

echo 'installing  aptitude' 
sudo apt install aptitude

echo 'installing  curl' 
sudo aptitude install apt-transport-https curl -y

echo 'installing git' 
sudo aptitude install git -y

echo "Qual usuario você usa no Git user.name"
echo "For example, mine will be \"Erick Wendel\""
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
sudo aptitude update
sudo aptitude install brave-browser -y

echo 'installing google chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo aptitude install -f

echo 'installing g++'
sudo aptitude install g++ -y

echo 'installing dbeaver'
wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo aptitude install -f

echo 'installing spotify'
sudo snap install spotify

echo 'installing VSCode'
sudo snap install code --classic

echo 'installing PyCharm'
sudo snap install pycharm-community --classic

echo 'installing Sublime'
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo aptitude install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo aptitude update
sudo aptitude install sublime-text

echo 'installing Atom'
wget -c https://atom.io/download/deb
sudo dpkg -i atom-amd64.deb

echo 'installing Flameshot'
sudo aptitude install flameshot

echo 'installing Node.js'
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo aptitude install -y nodejs

echo 'installing Insomnia'
sudo snap install insomnia

echo 'installing Zsh'
sudo aptitude install zsh

echo 'installing Oh My Zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo aptitude update -y && sudo aptitude upgrade -y

echo 'Finished! :D'
