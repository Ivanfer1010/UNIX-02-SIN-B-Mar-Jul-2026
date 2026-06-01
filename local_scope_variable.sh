#!/usr/bin/env bash
PUBLISHER="No Starch Press"  #PUBLISHER is a global variable,any variable  created outside or inside a function is global by default.
print_name(){
 local name  #is  local variable, local variables only exist within the function where they were created.
 name="Black Hat Bash"
 echo "${name} by ${PUBLISHER}"
}
print_name #Call the function is needed when we put the variable name.
echo "Variable ${name} will not be printed because it is a local variable."
