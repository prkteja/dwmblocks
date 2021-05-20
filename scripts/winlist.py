#!/bin/python
import subprocess
import os

splitter = '   :   '
prompt = "Switch to window  >"

windowlist = (subprocess.check_output(["wmctrl", "-l", "-x"])).decode('utf-8')
lines = windowlist.split('\n')
if lines[-1] == '': lines = lines[:-1]
windowclass = []
windowtitle = []
windowid = []
titledict = {} # hold number of times a title has appeared
for line in lines:
    words = line.split()
    windowid.append(words[0])
    windowclass.append(words[2].split('.')[-1])
    title = ' '.join(words[4:])
    if title in titledict:
        titledict[title] += 1
        title += "  <{}>".format(titledict[title])
    else:
        titledict[title] = 1
    windowtitle.append(title)

dmenu_input = ''
for i in range(len(windowtitle)):
    dmenu_input += windowclass[i] + splitter + windowtitle[i] + '\n'
args = ["dmenu", "-i", "-p", prompt, "-l", "20"]
child_proccess = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
output = child_proccess.communicate(dmenu_input.encode('utf-8'))[0]
choice = output.decode('utf-8')
if choice == '': exit(0)
if choice[-1] == '\n': choice = choice[:-1]
windowname = splitter.join(choice.split(splitter)[1:])
winindex = windowtitle.index(windowname)
os.system("xdotool windowactivate " + windowid[winindex])
