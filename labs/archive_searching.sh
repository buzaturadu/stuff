#!/bin/bash

if [ $UID = 0 ]; then
   echo "Proceed Master"
   else
echo "root required"
fi

a=/directorulcaretrebuiesters

mkdir .$a

find . -iname '*.tar.gz' -exec tar -xzf '{}' -C .$a \;

c=`find .$a -type f -exec grep -H  'much Open, such Stack' {} \; | wc -l`
n=`find .$a -type f -exec grep -H -l 'much Open, such Stack' {} \;`

echo "The files that contains \"much Open, such Stack\" are"
echo $n

echo "The number of files containing \"much Open, such Stack\" is $c"
echo $c times in these files: $n 

rm -r .$a
