#!/usr/local/bin/bash

PANEL_FONT_0="-misc-tamsyn-medium-r-normal-*-15-108-100-100-c-80-iso8859-1"

#this second font is for icons. If they are not displayed, then you need to setup UTF8 locale
PANEL_FONT_1="-wuncon-siji-medium-r-normal-*-10-100-75-75-c-80-iso10646-1"

PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=16

#gruvbox style
#COLOR_DEFAULT_BG="#1f1f1f"
#COLOR_DEFAULT_FG="#c0b18b"

#wombat style
COLOR_DEFAULT_BG="#101010"
COLOR_DEFAULT_FG="#b9b9b9"

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

info_Battery()
{
    STATE="$(sysctl hw.acpi.battery.state | awk '{ print $2 }')"
    CHARGE="$(sysctl hw.acpi.battery.life | awk '{ print $2 }')"

    case $STATE in
            1)
                #discharging
                OUTPUT="\ue1fe $CHARGE"
                ;;
            2)
                #charging
                OUTPUT="\ue200 $CHARGE"
                ;;
            7)
                #no battery attached, plugged.
                OUTPUT="\ue041 N/A"
                ;;
            *)
                OUTPUT="ERR"
                ;;
    esac
    printf "$OUTPUT"
    printf "%s" "%"
}

info_NetworkStatus()
{
    WIFI_INFO=$(ifconfig wlan0)
    WIFI_STATUS=$(printf "%s\\n" "$WIFI_INFO" | grep -w "status:" | awk '{ print $2 }')
    SSID=$(printf "%s\\n" "$WIFI_INFO" | grep -w "ssid" | awk '{ print $2 }')

    ETH_INFO=$(ifconfig em0)
    ETH_STATUS=$(printf "%s\\n" "$ETH_INFO" | grep -w "status:" | awk '{ print $2 }')

    if [ "$WIFI_STATUS" = "associated" -a "$ETH_STATUS" = "no" ]
    then
        printf "\ue14b ${SSID}"
    elif [ "$WIFI_STATUS" = "associated" -a "$ETH_STATUS" = "active" ]
    then
        printf "\ue149 Wired"
    else
        printf "\ue0c6 Down"
    fi     
}

info_Volume()
{
    GETVOL="$(mixer | grep vol | awk '{ print $7 }' | grep -o '[^:]*')"
    
    #this is for headphones icon: \ue04d
    printf "\ue05d "
    printf "%s\\n" "${GETVOL}% "
}

info_TimeDate()
{
    TTIME=$(date +"%H:%M")
    TDATE=$(date +"%m-%d-%Y")
       
    printf "\ue017 $TTIME | $TDATE \ue225"
}

info_CPU()
{
    USEDCPU=$(top -n | grep -w "CPU" | awk '{ print $2+$4+$6+$8 }')
    
    printf "\ue021"
    printf "%s\\n" "${USEDCPU}% |"
}

info_RAM()
{
    #check fix when some outputs are KB instead of MB
    GETRAM=$(top -n | grep -w "Mem" | awk '{ print $4}' | grep -o '[A-Z]')
    if [ $GETRAM = "K" ]
    then
        USEDRAM=$(top -n | grep -w "Mem" | awk '{ print $2+$6+$8 }')
    else
        USEDRAM=$(top -n | grep -w "Mem" | awk '{ print $2+$4+$6+$8 }')
    fi
    TOTALRAM=$(dmesg | grep -E '^avail memory' | cut -d'(' -f2 | cut -d')' -f1 | awk '{ print $1 }' | sed -n 1p)
    PRCNTUSED=$(awk -v u=$USEDRAM -v t=$TOTALRAM 'BEGIN{print 100 * u / t}' | awk -F. '{ print $1"."substr($2,1,2) }')

    printf "\ue224"
    printf "%s\\n" "${PRCNTUSED}% |"
}


info_DriveSpace()
{
    AVAIL=$(df -H / | grep -w "ROOT" | awk '{ print $4 }' | awk -F'[A-Z]' '{print $1}')
    TOTAL=$(df -H / | grep -w "default" | awk '{ print $2 }' | awk -F'[A-Z]' '{print $1}')
    printf "\ue1e0${AVAIL}GB "
}

#this requires coretemp or amdtemp loaded with kldload or in boot/loader.conf to work
info_CpuTemp()
{
    CURRENT=$(sysctl dev.cpu.0.temperature | awk '{ print $2 }')

    printf "\ue01d"
    printf "%s" "${CURRENT} |"
}

info_CPU > "$PANEL_FIFO" &
info_RAM > "$PANEL_FIFO" &
info_CpuTemp > "$PANEL_FIFO" &
info_DriveSpace > "$PANEL_FIFO" &
info_TimeDate > "$PANEL_FIFO" &
info_NetworkStatus > "$PANEL_FIFO" &
info_Volume > "$PANEL_FIFO" &
info_Battery > "$PANEL_FIFO" &


panel_bar()
{
    while true; do
            BAR_INPUT="%{l} $(info_CPU) $(info_RAM) $(info_CpuTemp) $(info_DriveSpace) %{c}$(info_TimeDate) %{r} $(info_NetworkStatus)  $(info_Volume) $(info_Battery)  "
        printf "%s\\n" "$BAR_INPUT"
    sleep 1
    done
}

panel_bar < "$PANEL_FIFO" | lemonbar -f $PANEL_FONT_0 -f $PANEL_FONT_1 -g x$PANEL_HEIGHT -F $COLOR_DEFAULT_FG -B $COLOR_DEFAULT_BG &

wait
