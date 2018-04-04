# run: xinit <window manager> or startx ~/.xinitrc <wm>
# default: fluxbox

session=${1:-fluxbox}

case $session in
    fluxbox           ) exec startfluxbox;;
    mate              ) exec mate-session;;
    cinnamon          ) exec cinnamon-session;;
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
