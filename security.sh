id
#It is used to display information about the current user.
cat /etc/passwd | head -10
#It is used to display only the first 10 lines of the /etc/passwd file, which contains information about system users.
cat /etc/group | head -10
#Displays the first 10 lines of the /etc/group file, which stores information about system groups.
groups
#Shows the groups to which the current user belongs in this case root
groups $USER
#Displays the groups to which the user whose name is stored in the $USER environment variable belongs
id -u
#Shows the User ID
id -g
#Shws the main group ID
id -G 
#Shows all the ID groups
cat /etc/group | grep root
#Filter the /etc/group file to show only the information for the root group.
cat /etc/gshadow
#It displays the contents of the /etc/gshadow file, which stores secure information about  system groups, including group passwords.
mkdir ~/proyecto_unix/
#Create a new directory called proyecto_unix
ls -la ~/proyecto_unix/
#List all files from the proyecto_unix directory in the user home directory
#Add group [options] group_name
#Create a simple group
sudo groupadd desarrolladores
sudo groupadd -g 2000 operaciones #Specific GID
#System group (GID < 1000)
sudo groupadd --system servicios_web
#verify that they were created
grep "desarrolladores\|operaciones\|servicios_web" /etc/group
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
#See main options
groupadd --help
#View the GID range in the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#System groups have a minimum GID lower than the user
#In Ubuntu, typically:
#SYS_GID_MIN = 100
#SYS_GID_MAX = 999
#GID_MIN = 1000
#GID_MAX = 60000
#addgroup [options] group_name
#Create groups with addgroup
sudo addgroup diseno
sudo addgroup --gid 2100 marketing
sudo addgroup --system cache_web
#Verify
grep "diseno\|marketing\|cache_web" /etc/group
#See which groups the current user belongs to
groups
id
#Add a user to a group with usermod(low level)
sudo usermod -aG desarrolladores $USER
sudo usermod -aG diseno $USER

#solution: Change user to root
sudo usermod -aG desarrolladores root
usermod -aG diseno root
#Check for changes in /etc/group
grep "desarrolladores\|diseno" /etc/group
#Add user to group with adduser (high level, Debian)
sudo adduser root marketing
#View current status
id root
grep root /etc/group
#Create a temporary group for the demo.
sudo groupadd grupo_temporal
sudo usermod -aG grupo_temporal root
id root  #Have temporal group
#Now the error: usermod sin -a
sudo usermod -G desarrolladores root
#This removes all child groups except developers.
id root #lost all the other groups
#Restore
sudo usermod -aG diseno,marketing,grupo_temporal root
id root  #Restores
#Prepare the stage for practice.
mkdir -p ~/lab_chgrp/{proyectos,reportes,scripts}
touch ~/lab_chgrp/proyectos/app.py
touch ~/lab_chgrp/proyectos/config.json
touch ~/lab_chgrp/reportes/informe.txt
touch ~/lab_chgrp/scripts/deploy.sh
#View the initial state: everyone has the user group
ls -la ~/lab_chgrp/proyectos/
ls -la ~/lab_chgrp/reportes/