#!/bin/bash
fileName="/home/abhijit/user/logger.log"
linenumber=$(grep -c ^ $fileName)
state=$(upower -i $(upower -e | grep BAT) | grep --color=never -E state|xargs|cut -d' ' -f2|sed s/%//)
perc=$(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//)
cmd1="xbacklight -dec 100"
cmd2="xbacklight -inc 10"
 


if test $linenumber -ge 20
	then
	$(cp /dev/null $fileName)
fi

echo "Tab2 Running $(date)  state----- $state  perc----- $perc" >> $fileName
case "$state" in
"charging" | "fully-charged")
    echo "$perc"
    if test $perc -ge 95
	then
	bash -c "$cmd1";
	bash -c "$cmd2";    	
	
    fi
    ;;
*)

     if test $perc -le 57
	then
	bash -c "$cmd1";
	bash -c "$cmd2";    	
	
    fi
    ;;

esac




