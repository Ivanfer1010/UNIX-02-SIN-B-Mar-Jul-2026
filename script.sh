ls -a
#ls is the command the - is the option and a is the argument
ls --all
#It is the same than the other command but in larger version.
#Command-Options-Arguments
ls -h
#This command is for human readable
ls -l -a -h
ls -l -ah
ls -lah
#This three commands are practicaly the same but one is more shorter and this allow speed.
#Lists files and directories in human-readable language
mkdir -- -rf
#Create a directory named rf
rm -rf
rmdir -- -rf
#It is used to recursively and forcibly delete files and directories in this case rf.
git clone --depth 1 https://github.com/torvalds/linux.git

ls --help
#Shows a summarized manual
man ls
#Show the entire manual
man git-clone
#Shows the git manual
--depth
#Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the
#histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.
chmod +x script.sh
#everyone can run it
chmod u+x script.sh 
#Only the owner can run it.
chmod 0-r secreto.txt
#Remove lecture to others
chmod u+rw,go-rwx privado
#Owner read/write, no one else can do anything.
sudo echo "hola" > /etc/archivo_protegido
#bash: /etc/archivo_protegido: Permission denied
#This command doesnt work because sudo is only working in echo.
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
#Write "hola" to a protected file using sudo tee to bypass system write restrictions, hiding the output in the terminal with /dev/null to make the process silent.
echo "hola" | sudo tee /etc/archivo_protegido 
#Write "hola" to a protected file using sudo tee to have write permissions, displaying the text on screen at the same time.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
#hola
#chao
#sudo execute as a root, sh open a shell and run with administrator privileges to add the text "chao" to the end of a protected system file, after that we verifiy with the command cat.
sudo su -
#Change the user to root and with exit we can logout from that.
echo "$HOME"
#Displays the full path of the current user's home directory.
echo '$HOME'
#With '' print the text in this case $HOME
umask
#displays the mask system's default 
touch archivo1
#Creates an empty file with that name if it does not exist; if it already exists, does not modify its contents
mkdir directorio1
#Create a new directory called directorio1 in the current location
ls -l
#List the permissions
#total 64
#-rw-rw-rw-  1 codespace root      34523 Apr 13 12:15 LICENSE
#-rw-rw-rw-  1 codespace root         70 Apr 13 12:15 README.md
#-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:32 archivo1
#drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:32 directorio1
#-rw-rw-rw-  1 codespace codespace  1186 Apr 15 13:25 ejercicio1.sh
#-rw-rw-rw-  1 codespace codespace   519 Apr 15 13:43 ejercicio2.sh
#-rwxrwxrwx  1 codespace codespace    44 Apr 15 13:03 hola.sh
#-rwxr-xr-x  1 codespace codespace     0 Apr 15 13:34 prueba.txt
#-rw-rw-rw-  1 codespace codespace  2271 Apr 27 12:31 script.sh
#-rwxrwxrwx  1 codespace codespace    43 Apr 15 13:17 test.sh
umask 027
#Change the permission of umask
touch archivo2
#Creates an empty file with that name if it does not exist; if it already exists, does not modify its contents
mkdir directorio2
#Create a new directory called directorio1 in the current location
ls -l
#List the permissions
# ls -l
#total 68
#-rw-rw-rw-  1 codespace root      34523 Apr 13 12:15 LICENSE
#-rw-rw-rw-  1 codespace root         70 Apr 13 12:15 README.md
#-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:32 archivo1
#-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:36 archivo2
#drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:32 directorio1
#drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:37 directorio2
#-rw-rw-rw-  1 codespace codespace  1186 Apr 15 13:25 ejercicio1.sh
#-rw-rw-rw-  1 codespace codespace   519 Apr 15 13:43 ejercicio2.sh
#-rwxrwxrwx  1 codespace codespace    44 Apr 15 13:03 hola.sh
#-rwxr-xr-x  1 codespace codespace     0 Apr 15 13:34 prueba.txt
#-rw-rw-rw-  1 codespace codespace  2750 Apr 27 12:37 script.sh
#-rwxrwxrwx  1 codespace codespace    43 Apr 15 13:17 test.sh
umask 077
#A permission mask that restricts the default permissions of new files and directories, so that only the owner will have full access.
touch secreto.txt
#Create a file named secreto.txt
mkdir privado
#Create a directory named privado
ls -l
#List permissions
#total 72
#-rw-rw-rw-  1 codespace root      34523 Apr 13 12:15 LICENSE
#-rw-rw-rw-  1 codespace root         70 Apr 13 12:15 README.md
#-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:32 archivo1
#-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:36 archivo2
#drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:32 directorio1
#drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:37 directorio2
#-rw-rw-rw-  1 codespace codespace  1186 Apr 15 13:25 ejercicio1.sh
#-rw-rw-rw-  1 codespace codespace   519 Apr 15 13:43 ejercicio2.sh
#-rwxrwxrwx  1 codespace codespace    44 Apr 15 13:03 hola.sh
#drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:41 privado
#-rwxr-xr-x  1 codespace codespace     0 Apr 15 13:34 prueba.txt
#-rw-rw-rw-  1 codespace codespace  3808 Apr 27 12:41 script.sh
#-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:41 secreto.txt
#-rwxrwxrwx  1 codespace codespace    43 Apr 15 13:17 test.sh
sudo apt-get update
#Update the list of available packages from the repositories configured on the system.
sudo apt-get install acl
#Install the acl (Access Control Lists) package
sudo chown -R $(whoami) . 
#Recursively changes the owner of all files and folders in the current directory to belong to the user running the command.
sudo setfacl -bnR .
#Recursively removes (-R) all extended access control lists (ACLs) on the current directory (.), leaving only basic system permissions.
umask 077
#Changes the mask to 077
touch se
#Create a file named se
mkdir pri
#Create a directory named pri
ls -l
#total 80
#-rw-rw-rw- 1 codespace root      34523 Apr 13 12:15 LICENSE
#-rw-rw-rw- 1 codespace root         70 Apr 13 12:15 README.md
#-rw-rw-rw- 1 codespace codespace     0 Apr 27 12:32 archivo1
#-rw-rw-rw- 1 codespace codespace     0 Apr 27 12:36 archivo2
#drwxrwxrwx 2 codespace codespace  4096 Apr 27 12:32 directorio1
#drwxrwxrwx 2 codespace codespace  4096 Apr 27 12:37 directorio2
#-rw-rw-rw- 1 codespace codespace  1186 Apr 15 13:25 ejercicio1.sh
#-rw-rw-rw- 1 codespace codespace   519 Apr 15 13:43 ejercicio2.sh
#-rwxrwxrwx 1 codespace codespace    44 Apr 15 13:03 hola.sh
#drwx------ 2 codespace codespace  4096 Apr 27 12:52 pri
#drwxrwxrwx 2 codespace codespace  4096 Apr 27 12:41 privado
#-rwxr-xr-x 1 codespace codespace     0 Apr 15 13:34 prueba.txt
#-rw-rw-rw- 1 codespace codespace  5374 Apr 27 12:46 script.sh
#-rw------- 1 codespace codespace     0 Apr 27 12:52 se
#-rw-rw-rw- 1 codespace codespace     0 Apr 27 12:41 secreto.txt
#-rwxrwxrwx 1 codespace codespace    43 Apr 15 13:17 test.sh
umask 022
#Return to original permissions
whoami
#Displays the name of the currently logged-in user.
echo "Hola" > mi_archivo
#Write the text “Hola” inside the file mi_archivo, creating it if it does not exist or overwriting its contents if it already exists.
ls -l mi_archivo
#Shows detailed information of mi_archivo like permissions.
#-rw-r--r-- 1 codespace codespace 5 Apr 27 13:12 mi_archivo
sudo useradd -m -s /usr/bin/zsh luna
#Create a new user named luna, generating its home directory (-m) and assigning /usr/bin/zsh as its default shell.
sudo chown luna mi_archivo
#Change the owner of the file mi_archivo to the user luna.
ls -l mi_archivo
#List the prmissions of the file mi_archivo
#-rw-r--r-- 1 luna codespace 5 Apr 27 13:12 mi_archivo
groups
#It displays the groups to which the current user belongs in the system.
sudo groupadd grupo_test
#Create a new group called grupo_test in the system.
groups
#It displays the groups to which the user currently logged into the system belongs.
touch comun
#Create a file named comun
ls -l comun
#List the permisions
#-rw-r--r-- 1 codespace codespace 0 Apr 27 13:32 comun
sudo usermod -a -G grupo_test luna
#Add the luna user to the test group without removing it from its other existing groups.
sudo chgrp grupo_test comun
#Change the group owner of the common file or directory to belong to the grupo_test.
ls -l comun
#List the permissions
#-rw-r--r-- 1 codespace grupo_test 0 Apr 27 13:32 comun
sudo chown luna:grupo_test mi_archivo
#Change the owner of the file archivo to the user luna and its group to the grupo_test.
ls -l mi_archivo
#List the permissions of the file mi_archivo
#-rw-r--r-- 1 luna grupo_test 5 Apr 27 13:12 mi_archivo
