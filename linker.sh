#!/bin/sh

error() {
  clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

create_links_msg() { \
  dialog --title "Instalacion" --infobox "Creando links..." 5 70
}

show_warning_msg() {
  dialog --title "Importante !!!" --yesno "Por ahora, corre este script desde el dir $HOME/dotfiles, de otra forma los links no se crearan bien.\\n\\nTu directorio actual es: $PWD\\n\\nDeseas continuar?" 10 70
}

create_links() {
  [ -d "$HOME/.config" ] || mkdir $HOME/.config
  ln -svhf $(readlink -f Xmodmap) $HOME/.Xmodmap
  ln -svhf $(readlink -f Xresources) $HOME/.Xresources
  #ln -svhf $(readlink -f ackrc) $HOME/.ackrc
  ln -svhf $(readlink -f bashrc) $HOME/.bashrc
  ln -svhf $(readlink -f calcurse) $HOME/.calcurse
  ln -svhf $(readlink -f crontab) $HOME/.crontab
  #ln -svhf $(readlink -f fetchmailrc) $HOME/.fetchmailrc
  #ln -svhf $(readlink -f fluxbox) $HOME/.fluxbox
  ln -svnf $(readlink -f fonts) $HOME/.fonts
  #ln -svhf $(readlink -f getmail) $HOME/.getmail
  ln -svhf $(readlink -f gitconfig) $HOME/.gitconfig
  ln -svhf $(readlink -f gitignore) $HOME/.gitignore
  ln -svhf $(readlink -f gvimrc) $HOME/.gvimrc
  #ln -svhf $(readlink -f ideskrc) $HOME/.ideskrc
  ln -svhf $(readlink -f irbrc) $HOME/.irbrc
  ln -svhf $(readlink -f mailcap) $HOME/.mailcap
  ln -svhf $(readlink -f mbsyncrc) $HOME/.mbsyncrc
  ln -svhf $(readlink -f mpdconf) $HOME/.mpdconf
  ln -svhf $(readlink -f msmtprc) $HOME/.msmtprc
  ln -svhf $(readlink -f muttrc) $HOME/.muttrc
  #ln -svhf $(readlink -f procmailrc) $HOME/.procmailrc
  ln -svhf $(readlink -f screenrc) $HOME/.screenrc
  ln -svhf $(readlink -f scripts) $HOME/bin
  ln -svhf $(readlink -f spacemacs) $HOME/.spacemacs

  [ -d "$HOME/.ssh" ] || mkdir $HOME/.ssh
  ln -svhf $(readlink -f ssh/config) $HOME/.ssh/config
  ln -svhf $(readlink -f ssh/config) $HOME/.ssh/config
  cp ssh/*.pub $HOME/.ssh/

  ln -svhf $(readlink -f tmux.conf) $HOME/.tmux.conf
  ln -svhf $(readlink -f utils) $HOME/.utils
  ln -svhf $(readlink -f vim) $HOME/.vim
  ln -svhf $(readlink -f vimrc) $HOME/.vimrc

  ln -svhf $(readlink -f wallpapers) $HOME/.wallpapers
  ln -svhf $(readlink -f xinitrc) $HOME/.xinitrc
  ln -svhf $(readlink -f zgen) $HOME/.zgen
  ln -svhf $(readlink -f zlogin) $HOME/.zlogin
  ln -svhf $(readlink -f zprofile) $HOME/.zprofile
  ln -svhf $(readlink -f zshenv) $HOME/.zshenv
  ln -svhf $(readlink -f zshrc-zgen-basic) $HOME/.zshrc

  #config
  ln -svhf $(readlink -f config/bspwm) $HOME/.config/bspwm
  ln -svhf $(readlink -f config/compton.conf) $HOME/.config/compton.conf
  ln -svhf $(readlink -f config/conky) $HOME/.config/conky
  ln -svhf $(readlink -f config/dunst) $HOME/.config/dunst
  ln -svhf $(readlink -f config/htop) $HOME/.config/htop
  ln -svhf $(readlink -f config/i3) $HOME/.config/i3
  ln -svhf $(readlink -f config/i3blocks) $HOME/.config/i3blocks
  ln -svhf $(readlink -f config/lf) $HOME/.config/lf
  ln -svhf $(readlink -f config/mc) $HOME/.config/mc
  ln -svhf $(readlink -f config/minidlna) $HOME/.config/minidlna
  ln -svhf $(readlink -f config/mpv) $HOME/.config/mpv
  ln -svhf $(readlink -f config/ncmpcpp) $HOME/.config/ncmpcpp
  #ln -svhf $(readlink -f config/nvim) $HOME/.config/nvim
  #ln -svhf $(readlink -f config/ranger) $HOME/.config/ranger
  ln -svhf $(readlink -f config/sxhkd) $HOME/.config/sxhkd
  ln -svhf $(readlink -f config/sxiv) $HOME/.config/sxiv
  ln -svhf $(readlink -f config/vifm) $HOME/.config/vifm
  ln -svhf $(readlink -f config/zathura) $HOME/.config/zathura
}

# Create soft links to config files in dotfiles dir
create_links_msg || error "User exited."

show_warning_msg
create_links

