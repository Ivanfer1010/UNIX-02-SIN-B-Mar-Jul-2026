#Change directory
cd
#Using cd move directly to the /home/codespace folder from wherever you are in the terminal.
cd /home/codespace
#It takes you directly to your personal directory.
cd ~
#Changes the directory to home
cd $HOME
#Creation of a route with the name "proyecto"
mkdir proyecto
#Changes the direcotry to the route "proyecto"
cd proyecto/
#List all files and folders in the directory
ls -lai
#total 12
#925547 drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:37 .
#918515 drwxr-x--- 1 codespace codespace 4096 Apr  6 12:37 ..
#Displays detailed information about the current  directory like the birth of the file, acces, ,modify , inode, ect
stat .
#Creates various directories, including intermediate folders if they dont exist
mkdir -p /tmp/prueba/sub1 /tmp/prueba/sub2
#Displays detailed informaton about the current directory
stat /tmp/prueba
#Shows the manual of mkdir we can use this coomand for other files.
man mkdir
#Print working directory Where I am
pwd
#What is the user I am logged in with
whoami
#show details of the file
ls
#shows details of the file in large format
ls- l
#List all files and folders, including hidden ones
ls -la
#View files with easy-to-understand details and sizes
ls -lh
#Lists files and folders in the current directory with detailed information, sorted by modification date
ls -lt
#Lists the files and folders that are in the root of the system.
ls /
#Search the directories of the system only shows the first 20 lines
ls /etc | head -20
ls /dev | head -20