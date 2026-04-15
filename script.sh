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