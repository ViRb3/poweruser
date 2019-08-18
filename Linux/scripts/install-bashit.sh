#!/bin/bash
#
# Install bashit
#

sudo apt install git -y

git clone "https://github.com/Bash-it/bash-it.git" ~/.bash_it
~/.bash_it/install.sh
sed -i -e "s/export BASH_IT_THEME='bobby'/export BASH_IT_THEME='candy'/g" ~/.bashrc