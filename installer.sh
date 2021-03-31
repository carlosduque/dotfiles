#!/bin/sh

while getopts ":p:r:h" o; do case "${o}" in
    p) pkgfile=${OPTARG} ;;
    r) role=${OPTARG} ;;
    h) printf "Argumentos opcionales:\\n  -p: Archivo CSV con paquetes a instalar\\n  -r: el rol a usar\\n  -h: Mostrar este mensaje\\n" && exit 1 ;;
    *) printf "Opcion invalida: -%s\\n" "$OPTARG" && exit 1 ;;
esac done

[ -z "$pkgfile" ] && pkgfile="packages.csv"
[ -z "$role" ] && role="R"

install_pkg(){ sudo pkg install -y "$1" >/dev/null 2>&1 ;}

error() {
  clear; printf "ERROR:\\n%s\\n" "$1" >&2; exit 1;
}

welcome() {
  dialog --title "Bienvenido!" --msgbox "Este script te permitira inicializar un sistema FreeBSD!\\n\\nEsta basado en los gustos y preferencias del autor. \\n\\n-Carlos" 10 60
  dialog --colors --title "Nota Importante!" --yes-label "OK, Sigamos!" --no-label "No, hasta aqui llego..." --yesno
  "Asegurate de que tu usuario pueda instalar paquetes en el sistema usando \"sudo\" sin necesidad de introducir tu
  password (passwordless). \\n\\nEste script esta basado en las utilidades de Luke Smith (LARBS) para sistemas Arch Linux." 8 70
}

preinstall_msg() { \
  dialog --title "Empezamos?" --yes-label "Si!" --no-label "No, mejor no!" --yesno "Yo me encargo del resto asi que puedes sentarte, disfrutar de un buen cafe y relajarte mientras instalo todo.\\n\\nLlevara algo de tiempo dependiendo de tu velocidad de conexion. Ahora solo tienes que presionar <Si!> y me pongo a trabajar!" 13 60 || { clear; exit 1; }
}

role_msg() {
  role=$(dialog --title "..:: Rol ::.." --menu "Que tanto software debo instalar?\\n\\nEstas opciones son acumulativas, o sea, si
  escoges 'X', eso implica que se instalaran R, U y X. \\n\\nAlgo asi: R < U < X < D < o < O < T" 20 60 40 \
  "R" "Lo minimo" \
  "U" "Homo Unix" \
  "X" "Apps para Xorg" \
  "D" "Desktop (Cinnamon y Mate)" \
  "o" "Opcionales de terminal" \
  "O" "Opcionales de Xorg" \
  "T" "Todo en la lista" 3>&1 1>&2 2>&3 3>&1) || exit 1
}

main_install() {
  dialog --title "..:: Instalacion ::.." --infobox "Instalando \`$1\` ($n de $total). $1 $2" 5 70
  install_pkg "$1"
}

install_required() {
  for x in vim-tiny git-tiny; do
    dialog --title "..:: Instalacion ::.." --infobox "Instalando \`$x\` que es requerido para instalar el resto." 5 70
    install_pkg "$x"
  done
}

install_from_list() { \
  [ -f "$pkgfile" ] && cp "$pkgfile" /tmp/progs.csv
  total=$(wc -l < /tmp/progs.csv)
  while IFS=, read -r tag package category desc; do
    n=$((n+1))
    #echo "$desc" | grep -q "^\".*\"$" && desc="$(echo "$desc" | sed "s/\(^\"\|\"$\)//g")"
    case "$role"  in
        "R") [ $tag == "R"] && main_install "$package" "Requeridos: $category:$desc" ;;
        "U") [ $tag == "U" -o $tag == "R" ] && main_install "$package" "Homo Unix: $category:$desc" ;;
        "X") [ $tag == "X" -o $tag == "U" -o $tag == "R" ] && main_install "$package" "Xorg: $category:$desc" ;;
        "D") [ $tag == "D" -o $tag == "X" -o $tag == "U" -o $tag == "R" ] && main_install "$package" "Desktop: $category:$desc" ;;
        "o") [ $tag == "o" -o $tag == "D" -o $tag == "X" -o $tag == "U" -o $tag == "R" ] && main_install "$package" "Opcional de terminal: $category:$desc" ;;
        "O") [ $tag == "O" -o $tag == "o" -o $tag == "D" -o $tag == "X" -o $tag == "U" -o $tag == "R" ] && main_install "$package" "Opcional de Xorg: $category:$desc" ;;
        "T") main_install "$package" "Todos: $category:$desc" || { clear; exit 1; } ;;
    esac
  done < /tmp/progs.csv ;}

finalize() {
  dialog --title "..:: Hecho! ::.." --msgbox "Felicidades! No parece haber fallado nada asi que el script finalizo exitosamente y todos los paquetes y archivos de configuracion deben estar en su lugar!\\n\\nPara arrancar el ambiente grafico ejecuta el comando \"xinit\".\\n\\n--Carlos" 12 80
}

tuning_it() {
  dialog --title "..:: Instalacion ::.." --infobox "Apagando la f$%& campanita del sistema" 5 70
  sudo sysctl kern.vt.enable_bell=0
  # make zsh the default shell for the user.
  dialog --title "..:: Instalacion ::.." --infobox "Cambiando a un shell superior" 5 70
  chsh -s /usr/local/bin/zsh `whoami` >/dev/null 2>&1
  if [ $role == "X" -o $role == "D" ]; then
    # keyboard layout: Spanish Dvorak
    dialog --title "..:: Instalacion ::.." --infobox "Cambiando el teclado en Xorg a Dvorak en español, porque también es superior" 5 70
    [ ! -f /usr/local/etc/X11/xorg.conf.d/kbd-layout.conf ] && printf 'Section "InputClass"
        Identifier "KeyboardDefaults"
        Driver "keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "es"
        Option "XkbVariant" "dvorak"
    EndSection\\n' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/kbd-layout.conf
  fi

  dialog --title "..:: Instalacion ::.." --infobox "Sincronizando la hora del sistema, por si las moscas..." 4 70
  sudo ntpdate 0.us.pool.ntp.org >/dev/null 2>&1

  uuid=dbus-uuidgen > /var/lib/dbus/machine-id
  dialog --title "..:: Instalacion ::.." --infobox "Genere un numero que parece importante, pero que realmente no lo es:\\n UUID: $uuid" 4 70
}

# MAIN
welcome || error "User exited."

role_msg || error "User exited."

# Last chance for user to back out before install.
preinstall_msg || error "User exited."

install_required || error "User exited."

# read the packages.csv file and install everything listed in there
install_from_list

tuning_it

# Last message! Install complete!
finalize
clear
pfetch

