#!/bin/bash
fileName="/home/abhijit/user/logger.log"
linenumber=$(grep -c ^ $fileName)
state=$(upower -i $(upower -e | grep BAT) | grep --color=never -E state|xargs|cut -d' ' -f2|sed s/%//)
perc=$(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//)

if test $linenumber -ge 20
	then
	$(cp /dev/null $fileName)
fi

echo "Tab Running $(date)  state----- $state  perc----- $perc" >> $fileName
case "$state" in
"charging" | "fully-charged")
    echo "$perc"
    if test $perc -ge 95
	then	
    	$(play /home/abhijit/user/battery_full.mp3)	
    fi
    ;;
*)
     if test $perc -le 30
	then	
    	$(play /home/abhijit/user/battery_low.mp3)
	
    fi
    ;;
esac




