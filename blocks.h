//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/				/*Command*/												/*Update Interval*/	/*Update Signal*/
	{"   ",					"~/.config/scripts/dwm_bar/network.sh",								    5,	1},
	{"\x03  󰤃\x01  󰔐   ",   "sensors dell_smm-isa-0000 | grep 'CPU:' | awk '{print $2}'",			3,  2},
	{"\x03  󰤃\x01  ",       "~/.config/scripts/dwm_bar/volume.sh",									60,	3},
	{"\x03  󰤃\x01  ",   	"~/.config/scripts/dwm_bar/battery.sh",								    10 ,4},
	{"\x03  󰤃\x01  󰃭   ",   "date '+%a, %b %d'",													30,	5},
	{"\x03  󰤃\x01  󰥔   ",   "date '+%l:%M %p' | sed 's/^ //'",										60,	6},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
// static char delim[] = "  \x03󰤃\x01    ";
static char delim[] = " ";
static unsigned int delimLen = 9;
// 󰔐 󰉁 󰖨 󱀣 󰈸 󰘬 󰣇 󰂚 󰂛 󰂞 󰳡 󰋎 󰃠 󰐥
