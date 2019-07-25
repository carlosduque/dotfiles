# run: xinit <window manager> or startx ~/.xinitrc <wm>

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

session=${1:-i3wm}

case $session in
    i3wm              ) exec i3;;
    dwm               ) exec dwm;;
#    fluxbox           ) exec startfluxbox;;
#    mate              ) exec mate-session;;
#    cinnamon          ) exec cinnamon-session;;
#    enlightenment     ) exec enlightenment_start;;
#    gnome             ) exec gnome-session;;
#    gnome-classic     ) exec gnome-session --session=gnome-classic;;
#    icewm             ) exec icewm-session;;
#    kde               ) exec startkde;;
#    unity             ) exec unity;;
#    xfce|xfce4        ) exec startxfce4;;
#    # No known session, try to run it as command
    *) exec $1;;
esac

