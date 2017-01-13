CURRENT=`pwd`
SETUPDIR="._xubuntu-setup"
#wget -O - https://raw.githubusercontent.com/lifeman/ansible-setup-xubuntu/master/install.sh | bash

if [ ! -d ~/"$SETUPDIR" ]
then
    echo "Installation python"
    sudo apt-get install -y -qq python python-pip git git-core openssh-server

    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y -qq ansible



    echo "Clone git https://github.com/lifeman/ansible-setup-xubuntu.git"
    sudo -u `whoami` -H git clone https://github.com/lifeman/ansible-setup-xubuntu.git $HOME/"$SETUPDIR"
else
    echo "The folder $SETUPDIR is already installed"
fi

cd $HOME/"$SETUPDIR"
read -p "Press [Enter] key to start deploying..."
ansible-playbook -i hosts playbook64.yml -c local -K -vvv

ansible-galaxy install gantsign.oh-my-zsh