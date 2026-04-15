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