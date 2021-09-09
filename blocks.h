//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/											/*Update Interval*/	/*Update Signal*/

	{"   ",   "~/.config/scripts/dwm_bar/network.sh",											    5,	0},
	{"\x09  󰤃\x01  󰔐   ",   "sensors dell_smm-virtual-0 | grep 'CPU:' | grep -o -P '\\+.*$' | awk '{$1=$1};1'",	3,  0},
	// {"",       "~/.config/scripts/dwm_bar/volume.sh",												60,	1},
	// {"\x01󰃠   ",   "brightnessctl | grep '%' | sed -e 's/.*(\\(.*\\)).*/\\1/'", 					30, 2},
	{"\x09  󰤃\x01  ",   	  "~/.config/scripts/dwm_bar/battery.sh",											    10 ,3},
	{"   \x04   󰃭   ",   "date '+%a, %b %d'",																	30,	0},
	{"   \x06   󰥔   ",   "date '+%l:%M %p' | sed 's/^ //'",													60,	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
// static char delim[] = "  \x09󰤃\x01    ";
static char delim[] = " ";
static unsigned int delimLen = 9;
// 󰔐 󰉁 󰖨 󱀣 󰈸 󰘬 󰣇
