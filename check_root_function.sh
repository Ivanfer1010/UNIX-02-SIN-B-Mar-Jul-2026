#!/usr/bin/env bash
# This function checks if the current user ID equals zero.
check_if_root(){
if [[ "${EUID}" -eq "0" ]]; then  #EUID determines what access permissions you have on the system at a specific time-
 return 0 #success                       #If EUID is 0 it means that is root
 else                             #eq is equal in thi case 0
 return 1  #failed
 fi
}
if check_if_root; then
 echo "User is root!"
else
 echo "User is not root!"
fi
#I created another user named trabajo with the command "adduser trabajo"
#Then I enter in the user space with su trabajo and execute the bash
#Finally leave with "exit"
#[Ivan Gualotuña] UNIX-02-SIN-B-Mar-Jul-2026 ➜ # su trabajo
#┌──(trabajo㉿codespaces-1e27e4)-[/workspaces/UNIX-02-SIN-B-Mar-Jul-2026]
#└─$ bash check_root_function.sh
#User is not root!


