set -e
set -u

is_app_installed() {
    type "$1" &>/dev/null
}

if ! is_app_installed zsh; then
    printf "WARNING: \"zsh\" command is not found.\n"
    printf "To install it: sudo apt-get install zsh\n"
    exit 1
fi

if ! is_app_installed tmux; then
    printf "WARNING: \"tmux\" command is not found.\n"
    printf "To install it: sudo apt-get install tmux\n"
    exit 1
fi

# install antigen
curl -L git.io/antigen > .antigen.zsh

# create symbolic links to config
ln -fs ~/.config/.tmux.conf ~
ln -fs ~/.config/.vimrc ~
ln -fs ~/.config/.bash_aliases ~
ln -fs ~/.config/.zshrc ~

# update Vim look & feel
if [ -e "$HOME/.vim/bundle/Vundle.vim" ]; then
    printf "Vundle already installed!\n"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

# tmux plugins
git clone https://github.com/tmux-plugins/tmux-battery ~/.tmux

printf "Successfully installed!\n"
