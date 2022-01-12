#!/bin/sh

if [ "$(cat /sys/class/net/wlp3s0/carrier)" == "1" ]; then
    network="$(nmcli -t -f active,ssid, dev wifi | egrep '^yes' | cut -d\' -f2 | cut -d ':' -f2)"
    if [ "$network" == "" ]; then
    	echo " 󰤭 "
    else
    	symbol="󰤨"
    	strength=$(cat /proc/net/wireless | tail -n 1 | awk '{print $4}' | sed 's/\.//g')
    	if [ $strength -lt -80 ]; then
    		symbol="󰤯"
    	elif [ $strength -lt -80 ]; then
    	    symbol="󰤯"
    	elif [ $strength -lt -70 ]; then
   	    	symbol="󰤟"
    	elif [ $strength -lt -60 ]; then
 	        symbol="󰤢"
 	    elif [ $strength -lt -60 ]; then
 	    	symbol="󰤥"
 	    fi  	
		echo -e " $symbol   $network"
		# echo -e "$network"
    fi
elif [ "$(cat /sys/class/net/enp2s0/carrier)" == "1" ]; then
    echo " 󰣸   Wired"
elif [ "$(cat /sys/class/net/enp0s20f0u4/carrier)" == "1" ]; then
    echo " 󰣸   Wired2"
else
    echo " 󰤮   ?"
fi
