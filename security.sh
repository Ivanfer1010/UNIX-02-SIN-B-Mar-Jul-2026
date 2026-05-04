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