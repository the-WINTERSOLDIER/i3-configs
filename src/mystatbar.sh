#!/bin/sh
# Send the header so that i3bar knows we want to use JSON:
echo '{ "version": 1 }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'
bg1="#5F4B8BFF"
fg1="#E69A8DFF"
bg_bar_color="#282A36"
separator() {
  echo -n "{"
  echo -n "\"full_text\":\"\"," # CTRL+Ue0b2
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border\":\"#333333\","
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"$2\""
  echo -n "}"
}
common() {
  echo -n "\"border\": \"#333333\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0"
}
mydate() {
  echo -n ",{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\" $(date "+%d-%m-%y   %H : %M")  \","
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"$2\","
  common
  
  echo -n "},"
}

battery(){
	stat=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2)
	ico=""   
	perc=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)	
if [ "$stat" = "Discharging" ]; then
       	if [ $perc -ge 80 ]; then ico="" 
        elif [ $perc -ge 60  ]; then ico=""     
        elif [ $perc -ge 45  ]; then ico=""     
        elif [ $perc -ge 30  ]; then ico=""     
        elif [ $perc -ge 20  ]; then ico=""
        elif [ $perc -ge 7  ]; then ico=""
        fi
fi

if [ $perc -le 25  ]; then 
    notify-send -t -u  3000 "PLUG TO CHARGER" "battery below 20 percent"
fi

echo -n ",{"
echo -n " "
echo -n "\"name\":\"bat\","
echo -n "\"full_text\":\" $ico $perc \","
echo -n "\"color\":\"$1\","
echo -n "\"background\":\"$2\","
common

echo -n "},"
}
volume(){
	vol=$(pactl list sinks |grep Volume:\ fr|awk '{print $5} ')
	mute=$(pactl list sinks |grep Mute|awk '{print $2}')
	ico=" "
	if [ "$mute" = "yes"  ]; then
		ico=""
	fi

	
echo -n ",{"
echo -n " "
echo -n "\"name\":\"vol\","
echo -n "\"full_text\":\" $ico $vol \","
echo -n "\"color\":\"$1\","
echo -n "\"background\":\"$2\","
common

echo -n "},"
}
werkspace(){
	r=$(xprop -root |grep _NET_CURRENT_DESKTOP|head --lines=1|awk {'print $3'})
	d=1
	ico=""

	
echo -n ",{"
echo -n " "
echo -n "\"name\":\"ws\","
echo -n "\"full_text\":\" $ico $(( $d + $r ))   \","
echo -n "\"color\":\"$1\","
echo -n "\"background\":\"$2\","
common

echo -n "},"
}



while :;
do
	echo -n ",["
			separator "#F0F6F7FF" "#333333"
			werkspace  "#000000" "#F0F6F7FF"
			separator "#E94B3CFF" "#F0F6F7FF"
			volume "#2D2926FF" "#E94B3CFF" 
			separator $bg1 "#E94B3CFF"	
			mydate	"#000000" $bg1
			separator "#F2AA4CFF" $bg1
			battery  "#101820FF" "#F2AA4CFF"
			separator "#333333" "#F2AA4CFF"
				
	echo -n "]"

  sleep 2 

done
#launched as background process



