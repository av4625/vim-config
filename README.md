# Steps to setup vimrc #

* mkdir .vim
* cd .vim
* git clone git@bitbucket.org:av4625/vim-config.git
* cd ..
* mv .vim/.vimrc .
* git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
* vim .vimrc
* :PluginInstall