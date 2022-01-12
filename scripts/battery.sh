#!/bin/sh
#󱐋󱐋󱐋
status=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)
charge=$(cat /sys/class/power_supply/BAT0/capacity)
symbol=""
if [ $charge -lt 10 ];then
	symbol="󰂎"
elif [ $charge -lt 20 ];then
	symbol="󰁺"
elif [ $charge -lt 30 ];then
	symbol="󰁻"
elif [ $charge -lt 40 ];then
	symbol="󰁼"
elif [ $charge -lt 50 ];then
	symbol="󰁽"
elif [ $charge -lt 60 ];then
	symbol="󰁾"
elif [ $charge -lt 70 ];then
	symbol="󰁿"
elif [ $charge -lt 80 ];then
	symbol="󰂀"
elif [ $charge -lt 90 ];then
	symbol="󰂁"
else
	symbol="󰁹"
fi  

if [ "$status" == "on" ];then
	symbol="$symbol󱐋"
	notify-send.sh --close=98
else
	notify-send.sh --close=99
fi

if [ -f "/sys/class/power_supply/BAT0/capacity" ];then
	charge=$(cat /sys/class/power_supply/BAT0/capacity)
	if [ $charge -lt 10 ];then
		if [ "$status" == "off" ];then
			systemctl hibernate
		fi
	fi
	if [ $charge -lt 20 ];then
		if [ "$status" == "off" ];then
			notify-send.sh -u critical "󰂃 Battery Low!" --replace=98
		fi
	fi
	if [ $charge -gt 80 ];then
		if [ "$status" == "on" ];then
			notify-send.sh "󰂃 Battery Charged!" --replace=99
		fi
	fi
    echo -e "\x01$symbol  $charge%"
    
else
    echo 100%
fi

case $BUTTON in
		  4) brightnessctl set 5%- &&
			 /home/rohit/.config/xob/scripts/brightness.sh;;
		  5) brightnessctl set 5%+ &&
			 /home/rohit/.config/xob/scripts/brightness.sh;;
esac

