#!/bin/bash

#   Name: Yogendra Aslekar
#	CreationDate: 03 Apr 2022
#	Last Modified: 03 Apr 2022
#	Description: Handle user management tasks by menu script	
#	Notes: !! Please run this script with root user !!


################ Menu Based user mgmt ###########

echo "Hello ! Please select correct option below:"
echo "1. Add New User"
echo "2. Unlock User"
echo "3. Password Reset"
echo "4. Get User Info"
echo "5. Delete User"
echo "0. Exit"
read -n 1 -p "Selected Option : " CHOICE
echo -e "\n"
read -p "UserName : " USERNAME

#echo $CHOICE
#echo $USERNAME

case $CHOICE in
'1')
	echo -e "(Add New User)"
	echo -e "\n 1. Admin "
	echo -e " 2. Normal \n"
	read -n 1 -p " Select Option: " USER_TYPE
	case $USER_TYPE in
	'1')
		echo -e "\n useradd -a -G wheel -c 'Admin User' -p $USERNAME $USERNAME"
		#echo $USERNAME\n$USERNAME | passwd $USERNAME
	;;
	'2')
		echo -e "\n useradd -c 'Normal User' -p $USERNAME $USERNAME"
	;;
	esac
;;
'2')
	echo -e "(Unlock User)"
	echo -e "\n User status:"
	echo -e "\n passwd --status $USERNAME"
	read -n 1 -p " Do you want to reset user? (Y/N):" ANS
	if [[($ANS == 'Y') || ($ANS == 'y') ]]; then
		echo -e "\n You Choose: $ANS" 
		echo -e " passwd -u $USERNAME"
	else
		echo -e "\n You Choose to exit !"
		#exit 1
	fi
;;
'3')
	echo -e "(Password Reset)"
	echo -e "echo $USERNAME\n$USERNAME | passwd $USERNAME"
	echo -e "passwd -e $USERNAME"
;;
'4')
	echo -e "(Get User Info)"
	echo -e "id $USERNAME"
;;
'5')
	echo -e "(Delete User)"
	echo -e "killall -u $USERNAME"
	echo -e "userdel -r $USERNAME"
;;
'0')
	exit 1
;;
esac
