#!/bin/sh
#󰍬󰍭󰍯  󰕾 󰕿 󰖀 󰖁 

mic="󰍬"
micmute=$(pactl list sources | grep Mute | tail -n 1 | awk -F ":" '{print $2}'| xargs)
micinuse=$(lsof /dev/snd/* | grep pcmC1D0c)

if [ "$micmute" = "yes" ]; then
	mic="󰍭"
fi

if [ "$micinuse" == "" ]; then
	mic=""
fi

SINK=$(pactl list short sinks | grep -n RUNNING | cut -d":"  -f1)
if [ "$SINK" = "" ]; then
  SINK=1
fi
NOW=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $SINK | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
MUTE=$(pactl list sinks | grep '^[[:space:]]Mute:'| head -n $SINK | tail -n 1 | awk -F ":" '{print $2}'| xargs)

if [ "$MUTE" = "yes" ]; then
	if [ "$mic" == "" ]; then
 		echo "󰖁"
 	else
 		echo "󰖁   •  $mic"
 	fi
else
	symbol="󰕾"
	if [ $NOW -lt 2 ]; then
		symbol="󰕿"
	elif [ $NOW -lt 25 ]; then
		symbol="󰖀"
	fi
	if [ "$mic" == "" ]; then
		echo "$symbol   $NOW%"
	else
 		echo "$symbol   $NOW%" " •  $mic"
 	fi
fi

case $BLOCK_BUTTON in
          1) setsid -f st -c stpulse -n stpulse -e ncpamixer ;;
esac
