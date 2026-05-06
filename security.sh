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