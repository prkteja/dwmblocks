#!/bin/sh

if [ -f "/sys/class/net/wlp3s0/carrier" ]; then
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
    	echo " $symbol  " $network
    fi
elif [ -f "/sys/class/net/enp2s0/carrier" ]; then
    echo " 󰣸"
else
    echo " 󰤮 "
fi
