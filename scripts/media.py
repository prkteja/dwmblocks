#!/usr/bin/python3
import os
import subprocess

status = subprocess.check_output(['playerctl', '-a', 'status']).decode('utf-8')
if 'Playing' in status:
    os.system('playerctl -a pause')
else:
    instances = subprocess.check_output(['playerctl', '-l']).decode('utf-8')
    details_raw = subprocess.check_output(['playerctl', '-a', 'metadata', '-f', '{{playerName}}   :   {{title}}'])
    details = details_raw.decode('utf-8').split('\n')[:-1]
    args = ["dmenu", "-i", "-p", "Choose Media  >", "-l", "20"]
    child_proccess = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    output = child_proccess.communicate(details_raw)[0]
    choice = output.decode('utf-8')[:-1]
    if not choice in details:
        exit(1)
    else:
        player = instances.split('\n')[details.index(choice)]
        os.system('playerctl -p {} play'.format(player))
    


