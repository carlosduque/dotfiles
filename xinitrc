# run: xinit <window manager> or startx ~/.xinitrc <wm>

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

session=${1:-bspwm}

sxhkd -m -1 &
musicpd &
dunst &
#compton &
##xrandr --output VGA-0 --mode 1024x768
##xrandr --output VGA-0 --mode 1680x1050
feh --bg-scale ~/.wallpapers/current.jpg

case $session in
    i3wm              ) pkill sxhkd; exec ssh-agent -t 7200 i3;;
#    dwm               ) exec dwm;;
    bspwm             ) exec ssh-agent -t 7200 bspwm;;
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

