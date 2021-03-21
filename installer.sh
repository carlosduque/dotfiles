#!/bin/sh

while getopts ":l:p:h" o; do case "${o}" in
	h) printf "Argumentos opcionales:\\n  -p: Archivo CSV con paquetes a instalar\\n  -l: Crear links)\\n  -h: Mostrar este mensaje\\n" && exit 1 ;;
	l) printf "not currently used" ;;
	p) pkgfile=${OPTARG} ;;
	*) printf "Opcion invalida: -%s\\n" "$OPTARG" && exit 1 ;;
esac done

[ -z "$pkgfile" ] && pkgfile="packages.csv"
[ -z "$links" ] && links="true"

install_pkg(){ sudo pkg install -y "$1" >/dev/null 2>&1 ;}

error() {
  clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

welcome() {
  dialog --title "Bienvenido!" --msgbox "Este script te permitira inicializar un sistema FreeBSD!\\n\\nEsta basado en los gustos y preferencias del autor y esto significa muchas opiniones personales en la configuracion.\\n\\n-Carlos" 10 60
  dialog --colors --title "Nota Importante!" --yes-label "OK, Sigamos!" --no-label "No, hasta aqui llego..." --yesno "Asegurate de que tu usuario pueda instalar paquetes en el sistema usando \"sudo\". Las aplicaciones mas llamativas de este sistema son: 1) Servidor X. 2) bspwm como window manager. 3) Aplicaciones de uso desde la terminal \\n\\nEste script esta basado en las utilidades de Luke Smith (LARBS) para sistemas Arch Linux." 8 70
}

preinstall_msg() { \
  dialog --title "Empezamos?" --yes-label "Si!" --no-label "No, mejor no!" --yesno "Yo me encargo del resto asi que puedes sentarte, disfrutar de un buen cafe y relajarte mientras instalo y configuro todo.\\n\\nLlevara algo de tiempo dependiendo de tu velocidad de conexion. Ahora solo tienes que presionar <Si!> y me pongo a trabajar!" 13 60 || { clear; exit 1; }
}

create_links_msg() { \
  dialog --title "Instalacion" --infobox "Creando links..." 5 70
}

role_msg() {
  role=$(dialog --title "Rol" --menu "Cual es el rol?" 13 60 40 \
  "R" "Lo minimo necesario" \
  "U" "Homo *Nix" \
  "o" "Opcionales de terminal" \
  "X" "Apps para Xorg" \
  "O" "Opcionales de Xorg" \
  "D" "Desktop (Cinnamon y Mate)" \
  "T" "Todo") || { clear; exit 1; }
}

create_links() {
  #echo "creating links..."
  [ -d "$HOME/.config" ] || mkdir $HOME/.config
  ln -sf $PWD/Xmodmap $HOME/.Xmodmap
  ln -sf $PWD/Xresources $HOME/.Xresources
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

main_install() {
  # Installs all needed programs from main repo.
  dialog --title "Instalacion" --infobox "Instalando \`$1\` ($n de $total). $1 $2" 5 70
  install_pkg "$1"
}

installation_loop() { \
  #([ -f "$pkgfile" ] && cp "$pkgfile" /tmp/progs.csv) || curl -Ls "$pkgfile" | sed '/^#/d' > /tmp/progs.csv
  [ -f "$pkgfile" ] && cp "$pkgfile" /tmp/progs.csv
  total=$(wc -l < /tmp/progs.csv)
  while IFS=, read -r tag package category desc; do
    n=$((n+1))
    echo "$desc" | grep -q "^\".*\"$" && desc="$(echo "$desc" | sed "s/\(^\"\|\"$\)//g")"
    #echo "$package" "$category:$desc"
    main_install "$package" "$category:$desc"
    #case "$tag" in
    #	"A") aurinstall "$program" "$comment" ;;
    #	"G") gitmakeinstall "$program" "$comment" ;;
    #	"P") pipinstall "$program" "$comment" ;;
    #	*) maininstall "$program" "$comment" ;;
    #esac
  done < /tmp/progs.csv ;}

finalize(){
  dialog --title "Hecho!" --msgbox "Felicidades! No parece haber fallado nada asi que el script finalizo exitosamente y todos los paquetes y archivos de configuracion deben estar en su lugar!\\n\\nPara arrancar el ambiente grafico ejecuta el comando \"xinit\".\\n\\n--Carlos" 12 80
}

# Welcome 
welcome || error "User exited."

#role_msg || error "User exited."

# Last chance for user to back out before install.
preinstall_msg || error "User exited."

for x in curl git ntp zsh; do
  dialog --title "Instalacion" --infobox "Instalando \`$x\` que es necesario para instalar el resto." 5 70
  install_pkg "$x"
done

#dialog --title "Instalacion" --infobox "Sincronizando la hora del sistema, por si las moscas..." 4 70
#sudo ntpdate 0.us.pool.ntp.org >/dev/null 2>&1

# Allow user to run sudo without password.
#>> "%wheel ALL=(ALL) NOPASSWD: ALL"

# The command that reads the packages.csv file and
# installs everything in there.
installation_loop

# Turn off the freaking bell !!
#systembeepoff

# Make zsh the default shell for the user.
#chsh -s /bin/zsh "$name" >/dev/null 2>&1
#sudo -u "$name" mkdir -p "/home/$name/.cache/zsh/"

# dbus UUID must be generated for Artix runit.
#dbus-uuidgen > /var/lib/dbus/machine-id

# Tap to click
#[ ! -f /etc/X11/xorg.conf.d/40-libinput.conf ] && printf 'Section "InputClass"
#        Identifier "libinput touchpad catchall"
#        MatchIsTouchpad "on"
#        MatchDevicePath "/dev/input/event*"
#        Driver "libinput"
#	# Enable left mouse button by tapping
#	Option "Tapping" "on"
#EndSection' > /etc/X11/xorg.conf.d/40-libinput.conf

# Create soft links to config files in dotfiles dir
create_links_msg || error "User exited."

create_links

# Last message! Install complete!
finalize
clear

