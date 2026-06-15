#!/usr/bin/env bash
for file in example_file*; do  #Start a loop that will iterate or traverse a list of elements.
 if [[ "${file}" == "example_file1" ]]; then  #It is a conditional structure ("if this condition is met, then do the following"). Compare if the filename being processed in that exact round is exactly the same as "example_file1". The quotation marks are used to avoid errors if the filename contains spaces.
 echo "Skipping the first file"   #If the current file turns out to be example_file1, the script will display the message "Skipping the first file" in the terminal.
 continue    #It's a command that tells the loop: "Stop here, don't continue with the lines below for this file, and jump directly to the next loop with the next file."
 fi    #It is used in Bash to mark the closing of the conditional structure we opened above.
 echo "${RANDOM}" > "${file}"   #It is an internal Bash variable that generates a random integer between 0 and 32767 each time it is invoked and redirect to the example file.
done    #Mark the end of the for loop