echo '#!bin/sh' > hola.sh
#Create a file called hola.sh and write #!bin/sh
echo 'echo "Hola desde mi primer script'" >> hola.sh
#Add the line echo "Hola desde mi primer script" to the end of the hola.sh file.
cat hola.sh
#$ cat hola.sh
##!bin/sh
#echo "Hola desde mi primer script"
#Print the content of the file hola.sh
./hola.sh
#bash: ./hola.sh: Permission denied
#Doesnt work becasuse we dont have enough permissions
ls -l hola.sh
#-rw-rw-rw- 1 codespace codespace 44 Apr 15 13:03 hola.sh
#Shows the permissions, owner, and size of the file hola.sh
chmod +x hola.sh
#Give permissions
ls -l hola.sh
#Verifiy the new permissions
#-rwxrwxrwx 1 codespace codespace 44 Apr 15 13:03 hola.sh
./hola.sh
#@Ivanfer1010 ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ ./test.sh
#bash: ./test.sh: cannot execute: required file not found
ls /etc
#List the contents of the /etc directory
touch /etc/prueba.txt
#Try creating an empty file called test.txt in the /etc folder, but we nedd to use sudo before
mkdir ~/mi-carpeta
#Create a new directory called mi-carpeta inside my home folder.
apt install cowsay
Try installing the Cowsay program but we need to write sudo before apt.
