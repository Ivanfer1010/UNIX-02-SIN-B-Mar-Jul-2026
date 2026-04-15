touch prueba.txt
#Create a an empty file.
chmod 600 prueba.txt
#Change the permissions of test.txt so that only the owner can read and write it.
ls -l prueba.txt
#Displays detailed permissions and attributes of prueba.txt
chmod 755 prueba.txt
#7 (Owner): Can read, write and execute ($4+2+1$).
#5 (Group): Can only read and execute ($4+1$).
#5 (Other): Can only read and execute ($4+1$).
#Change the permissions
ls -l prueba.txt
#-rwxr-xr-x 1 codespace codespace 0 Apr 15 13:34 prueba.txt
#Shows the changed permissions