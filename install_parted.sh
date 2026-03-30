#It keeps the system up to date, as it allows synchronizing the list of available packages with the official repositories.
 sudo apt update
#Download and install the latest versions of all software packages installed on theLinux system.
 sudo apt upgrade
#Install GNU Parted, a command-line tool for managing disk partitions in Linux.
 sudo apt install parted
#It displays complete information about disks and partitions, with a cleaner and easier-to-read format.
sudo parted -l && echo -e "\n" && lsblk -f && echo -e "\n---\n"
#This command allows you to quickly and easily identify whether the operating system is using UEFI or BIOS  boot mode.
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"
#Create a file with the given name and add the text
echo "esto es un archivo" > archivo.txt
#Inspect in detail the internal properties of a archivo.txt
archivo.txt