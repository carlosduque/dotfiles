#!/bin/sh

error() {
  clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

create_links_msg() { \
  dialog --title "Instalacion" --infobox "Creando links..." 5 70
}

create_links() {
  #echo "creating links..."
  echo "directorio de trabajo actual: $PWD"
  [ -d "$HOME/.config" ] || mkdir $HOME/.config
  ln -sf $PWD/$PWD/Xmodmap $HOME/.Xmodmap
  ln -sf $PWD/$PWD/Xresources $HOME/.Xresources
  #ln -sf $PWD/ackrc $HOME/.ackrc
  ln -sf $PWD/bashrc $HOME/.bashrc
  ln -sf $PWD/calcurse $HOME/.calcurse
  ln -sf $PWD/crontab $HOME/.crontab
  #ln -sf $PWD/fetchmailrc $HOME/.fetchmailrc
  #ln -sf $PWD/fluxbox $HOME/.fluxbox
  ln -sf $PWD/fonts $HOME/.fonts
  #ln -sf $PWD/getmail $HOME/.getmail
  ln -sf $PWD/gitconfig $HOME/.gitconfig
  ln -sf $PWD/gitignore $HOME/.gitignore
  ln -sf $PWD/gvimrc $HOME/.gvimrc
  #ln -sf $PWD/ideskrc $HOME/.ideskrc
  ln -sf $PWD/irbrc $HOME/.irbrc
  ln -sf $PWD/mailcap $HOME/.mailcap
  ln -sf $PWD/mbsyncrc $HOME/.mbsyncrc
  ln -sf $PWD/mpdconf $HOME/.mpdconf
  ln -sf $PWD/msmtprc $HOME/.msmtprc
  ln -sf $PWD/muttrc $HOME/.muttrc
  #ln -sf $PWD/procmailrc $HOME/.procmailrc
  ln -sf $PWD/screenrc $HOME/.screenrc
  ln -sf $PWD/scripts $HOME/bin
  ln -sf $PWD/spacemacs $HOME/.spacemacs

  [ -d "$HOME/.ssh" ] || mkdir $HOME/.ssh
  ln -sf $PWD/ssh/config $HOME/.ssh/config
  ln -sf $PWD/ssh/config $HOME/.ssh/config
  cp ssh/*.pub $HOME/.ssh/

  ln -sf $PWD/tmux.conf $HOME/.tmux.conf
  ln -sf $PWD/utils $HOME/.utils
  ln -sf $PWD/vim $HOME/.vim
  ln -sf $PWD/vimrc $HOME/.vimrc

  ln -sf $PWD/wallpapers $HOME/.wallpapers
  ln -sf $PWD/xinitrc $HOME/.xinitrc
  ln -sf $PWD/zgen $HOME/.zgen
  ln -sf $PWD/zlogin $HOME/.zlogin
  ln -sf $PWD/zprofile $HOME/.zprofile
  ln -sf $PWD/zhenv $HOME/.zshenv
  ln -sf $PWD/zhrc-zgen-basic $HOME/.zshrc

  #config
  ln -sf $PWD/config/bspwm $HOME/.config/bspwm
  ln -sf $PWD/config/compton.conf $HOME/.config/compton.conf
  ln -sf $PWD/config/conky $HOME/.config/conky
  ln -sf $PWD/config/dunst $HOME/.config/dunst
  ln -sf $PWD/config/htop $HOME/.config/htop
  ln -sf $PWD/config/i3 $HOME/.config/i3
  ln -sf $PWD/config/i3blocks $HOME/.config/i3blocks
  ln -sf $PWD/config/lf $HOME/.config/lf
  ln -sf $PWD/config/mc $HOME/.config/mc
  ln -sf $PWD/config/minidlna $HOME/.config/minidlna
  ln -sf $PWD/config/mpv $HOME/.config/mpv
  ln -sf $PWD/config/ncmpcpp $HOME/.config/ncmpcpp
  #ln -sf $PWD/config/nvim $HOME/.config/nvim
  #ln -sf $PWD/config/ranger $HOME/.config/ranger
  ln -sf $PWD/config/sxhkd $HOME/.config/sxhkd
  ln -sf $PWD/config/sxiv $HOME/.config/sxiv
  ln -sf $PWD/config/vifm $HOME/.config/vifm
  ln -sf $PWD/config/zathura $HOME/.config/zathura
}

# Create soft links to config files in dotfiles dir
create_links_msg || error "User exited."

create_links

