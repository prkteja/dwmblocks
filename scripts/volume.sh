#!/bin/sh
#󰍬󰍭󰍯  󰕾 󰕿 󰖀 󰖁 󰋎

mic="󰍬"
micmute=$(pactl list sources | grep Mute | tail -n 1 | awk -F ":" '{print $2}'| xargs)
micinuse=$(lsof /dev/snd/* | grep -e "pcm.*c")

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
PORT=$(pactl list sinks | grep 'Active Port' | awk '{print $3}')

hp=""

if [ "$PORT" = "analog-output-headphones" ]; then
	hp="   •   󰋎"
fi

if [ "$MUTE" = "yes" ]; then
	if [ "$mic" == "" ]; then
 		echo "󰖁$hp"
 	else
 		echo "󰖁$hp   •   $mic"
 	fi
else
	symbol="󰕾"
	if [ $NOW -lt 2 ]; then
		symbol="󰕿"
	elif [ $NOW -lt 25 ]; then
		symbol="󰖀"
	fi
	if [ "$mic" == "" ]; then
		echo "$symbol   $NOW%$hp"
	else
 		echo "$symbol   $NOW%" "$hp   •   $mic"
 	fi
fi


# notify-send.sh "$symbol  " -t 2000 -h int:value:"$NOW" --replace=555

case $BUTTON in
		  1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
		  3) pavucontrol & ;;
		  4) pactl set-sink-volume @DEFAULT_SINK@ -2% ;;
		  5) pactl set-sink-volume @DEFAULT_SINK@ +2% ;;
esac
