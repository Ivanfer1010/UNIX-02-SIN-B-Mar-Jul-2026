#View current main group
id
#uid=1000(vscode) gid=1000(vscode) groups=1000(vscode)
id -gn #Only the main group name
#Create a file and see which group inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#The group is the user's primary group.

#View the current group
id -gn
echo "Grupo actual: $(id -gn)"

#Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt

#Change to the "desarrolladores" group
newgrp desarrolladores
#Verify that the active group changes
id -gn
echo "Nuevo grupo activo: $(id -gn)"
#Create a file inside of subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
#The group is desarolladores now
#Create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/
#proyecto_dev/ have 'desarrolladores' group
#exit the newgrp subshell
exit
#Verify that we return to the original group
id -gn
echo "Grupo restaurado: $(id -gn)"

#Compare both files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt

#newgrp crate a subshell - this is demonstrable
echo "PID del shell actual: $$"
newgrp desarrolladores
echo "PID dentro de newgrp: $$"
#The PID it is different  - It is a child process