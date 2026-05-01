root: netlab123
sysadmin: netlab123

#Displays the files and folders in the current directory.
ls
#LICENSE  README.md  script_linux_cisco_1.sh

LS #Incorrect

#List the selected directory
ls LICENSE

#Easter egg
Aptitude moo

#Displays files/folders with detailed information in long list format
ls -l
#total 44
#-rw-rw-rw- 1 codespace root      34523 May  1 09:56 LICENSE
#-rw-rw-rw- 1 codespace root         70 May  1 09:56 README.md
#-rw-rw-rw- 1 codespace codespace   221 May  1 10:08 script_linux_cisco_1.sh

#Use the ls command with the -r (“reverse”) option, and it displays the files in reverse order to normal.
ls -r
#script_linux_cisco_1.sh  README.md  LICENSE

#Displays detailed information in reverse.
ls -l -r
#total 44
#-rw-rw-rw- 1 codespace codespace   689 May  1 10:13 script_linux_cisco_1.sh
#-rw-rw-rw- 1 codespace root         70 May  1 09:56 README.md
#-rw-rw-rw- 1 codespace root      34523 May  1 09:56 LICENSE

#A more advance version of the Easter egg
aptitude -v moo
aptitude -v -v moo
aptitude -vv moo

#Print working directory
pwd

#Change directory
cd
#Use the `cd`  command to navigate to the system's root directory.
cd /
#Return
 cd /home/codespace
 #/home/codespace

#Enter a folder called java within the current directory.
 cd java
#go to the current user's personal directory.
cd ~


