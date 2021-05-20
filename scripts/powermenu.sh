#!/bin/bash
choice="$(echo -e 'Lock\nSuspend\nHibernate\nRestart\nShutdown' | dmenu)"
if [ "$choice" == "Lock" ];then
	screenlock
elif [ "$choice" == "Suspend" ];then
	systemctl suspend
elif [ "$choice" == "Hibernate" ];then
	systemctl hibernate
elif [ "$choice" == "Shutdown" ];then
	confirm="$(echo -e 'OK\nCancel' | dmenu -p 'Confirm Shutdown?')"
	if [ "$confirm" == "OK" ];then
		systemctl poweroff
	fi
elif [ "$choice" == "Restart" ];then
	confirm="$(echo -e 'OK\nCancel' | dmenu -p 'Confirm Restart?')"
	if [ "$confirm" == "OK" ];then
		systemctl reboot
	fi
fi
