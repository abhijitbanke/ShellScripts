#!/bin/bash

#Execution format  ./dtaerange.sh /fileName.csv 2016-01-01 2016-08-30
input=$1
startdate=$2
enddate=$3
while IFS=',' read -r f1 f2 
do
 
fromDate="$startdate"
toDate="$startdate"
while true; do
    toDate=$( date +%Y-%m-%d --date "$fromDate +10 day" )  
if [ "$toDate" \> "$enddate" ];
then
    toDate=$enddate
fi 
   
    echo "$f1 $f2  -- > $fromDate -  $toDate"
if [ "$toDate" \= "$enddate" ];
then
    break
fi 
    fromDate=$( date +%Y-%m-%d --date "$toDate +1 day" )
done

done < "$input"



