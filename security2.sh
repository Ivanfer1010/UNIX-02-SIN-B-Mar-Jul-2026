#View current main group
id
#uid=1000(vscode) gid=1000(vscode) groups=1000(vscode)
id -gn #Only the main group name
#Create a file and see which group inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#The group is the user's primary group.