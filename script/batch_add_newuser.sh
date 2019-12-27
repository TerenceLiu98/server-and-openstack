#!/bin/bash

basepath=$(cd `dirname $0`; pwd)
cat $basepath/name.txt | while read line

#eampty the user.txt
#echo /dev/null > echo basepath/user.txt

do
echo "The user name is : ${line}"
echo
echo
echo "Now we add ${line} into user"

sleep 2

password=`echo $(date +%s%n)$RANDOM|md5sum |cut -c 2-9`
sudo adduser "${line}" << ENDX
$password
$password
First Last




Y
ENDX
echo
echo
echo -e "user: \t${line} passwd:$password" >> $basepath/user.txt
echo "The users password is $password"
echo
echo
chage -d 0 ${line}

done

exit 0
