#!/usr/bin/env bash
SIGNAL_TO_STOP_FILE="stoploop"  #we define a variable representing the name of the file for which the while loop 

while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
 echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exis
t..."
 echo "Checking again in 2 seconds..."             #This section utilizes a file test operator to perform continuous checks. The loop remains active until its specific condition is met. As soon as the target file is detected, the loop terminates, allowing the script to proceed to the final echo command.
 sleep 2
done

echo "File was found! Exiting..."  #Save this file as while_loop.sh and run it