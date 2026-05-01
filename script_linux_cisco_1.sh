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

#Displays a detailed list of the contents of the /var/log/ folder, which typically stores system log files.
ls -l /var/log/
#total 572
#lrwxrwxrwx 1 root root                39 Mar 11 11:59 README -> ../../usr/share/doc/systemd/README.logs
#-rw-r--r-- 1 root root             24519 Mar 11 12:19 alternatives.log
#drwxr-xr-x 1 root root              4096 Mar 11 12:17 apt
#-rw-r--r-- 1 root root             61229 Feb 10 14:05 bootstrap.log
#-rw-rw---- 1 root utmp                 0 Feb 10 14:05 btmp
#-rw-r--r-- 1 root root            481378 Mar 11 12:17 dpkg.log
#-rw-r--r-- 1 root root                 0 Feb 10 14:05 faillog
#-rw-r--r-- 1 root root               605 Mar 11 11:59 fontconfig.log
#drwxr-sr-x 2 root systemd-journal   4096 Mar 11 11:59 journal
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 lastlog
#drwx------ 2 root root              4096 Mar 11 11:59 private
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 wtmp

#Displays the files in the /var/log folder in detailed format and sorted by modification date, from most recent to oldest.
ls -lt /var/log   
#total 572
#-rw-r--r-- 1 root root             24519 Mar 11 12:19 alternatives.log
#-rw-r--r-- 1 root root            481378 Mar 11 12:17 dpkg.log
#drwxr-xr-x 1 root root              4096 Mar 11 12:17 apt
#-rw-r--r-- 1 root root               605 Mar 11 11:59 fontconfig.log
#lrwxrwxrwx 1 root root                39 Mar 11 11:59 README -> ../../usr/share/doc/systemd/README.logs
#drwxr-sr-x 2 root systemd-journal   4096 Mar 11 11:59 journal
#drwx------ 2 root root              4096 Mar 11 11:59 private
#-rw-r--r-- 1 root root             61229 Feb 10 14:05 bootstrap.log
#-rw-r--r-- 1 root root                 0 Feb 10 14:05 faillog
#-rw-rw---- 1 root utmp                 0 Feb 10 14:05 btmp
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 lastlog
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 wtmp

#List by the size of the file
ls -l -S /var/log    
#total 572
#-rw-r--r-- 1 root root            481378 Mar 11 12:17 dpkg.log
#-rw-r--r-- 1 root root             61229 Feb 10 14:05 bootstrap.log
#-rw-r--r-- 1 root root             24519 Mar 11 12:19 alternatives.log
#drwxr-xr-x 1 root root              4096 Mar 11 12:17 apt
#drwxr-sr-x 2 root systemd-journal   4096 Mar 11 11:59 journal
#drwx------ 2 root root              4096 Mar 11 11:59 private
#-rw-r--r-- 1 root root               605 Mar 11 11:59 fontconfig.log
#lrwxrwxrwx 1 root root                39 Mar 11 11:59 README -> ../../usr/share/doc/systemd/README.logs
#-rw-rw---- 1 root utmp                 0 Feb 10 14:05 btmp
#-rw-r--r-- 1 root root                 0 Feb 10 14:05 faillog
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 lastlog
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 wtmp

#List in reverse
ls -lSr /var/log
#total 572
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 wtmp
#-rw-rw-r-- 1 root utmp                 0 Feb 10 14:05 lastlog
#-rw-r--r-- 1 root root                 0 Feb 10 14:05 faillog
#-rw-rw---- 1 root utmp                 0 Feb 10 14:05 btmp
#lrwxrwxrwx 1 root root                39 Mar 11 11:59 README -> ../../usr/share/doc/systemd/README.logs
#-rw-r--r-- 1 root root               605 Mar 11 11:59 fontconfig.log
#drwx------ 2 root root              4096 Mar 11 11:59 private
#drwxr-sr-x 2 root systemd-journal   4096 Mar 11 11:59 journal
#drwxr-xr-x 1 root root              4096 Mar 11 12:17 apt
#-rw-r--r-- 1 root root             24519 Mar 11 12:19 alternatives.log
#-rw-r--r-- 1 root root             61229 Feb 10 14:05 bootstrap.log
#-rw-r--r-- 1 root root            481378 Mar 11 12:17 dpkg.log

#displays the contents of the /var/log folder in reverse order to the normal ls command.
ls -r /var/log   
#wtmp  private  lastlog  journal  fontconfig.log  faillog  dpkg.log  btmp  bootstrap.log  apt  alternatives.log  README

#It is used to switch to another user (usually the root superuser)
su -
su -l
su --login
#execute a command as another user without completely switching sessions.
sudo -u
#Run the sl program with administrator privileges.
sudo sl

