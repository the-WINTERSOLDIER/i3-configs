pactl get-sink-volume @DEFAULT_SINK@|awk {'print $5'}|cut -b -2 |head --lines=1
