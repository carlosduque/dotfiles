session=${1:-fluxbox}

case $session in
  fluxbox  ) exec startfluxbox;;
  cinnamon ) exec cinnamon-session;;
  *) exec $1 ;;
esac

