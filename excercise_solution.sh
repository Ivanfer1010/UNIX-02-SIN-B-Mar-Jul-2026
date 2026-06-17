#!/bin/bash
# Take the 1st argument provided in the terminal and store it in a variable called NAME
NAME="${1}"
# Take the 2nd argument provided in the terminal and store it in a variable called DOMAIN
DOMAIN="${2}"
# Define the string "results.csv" as the filename where the output will be stored
OUTPUT_FILE="results.csv"

# Start an IF condition: [[ -z ]] checks if the string length is zero (empty)
# The || operator means OR, so the condition triggers if either NAME or DOMAIN is missing
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  # Print an informative error message telling the user that two inputs are mandatory
  echo "You must provide two arguments to this script."
  # Print a practical example to show the user the correct syntax required to run it
  echo "Example: ${0} mysite nostarch.com"
  # Terminate the script immediately with exit code 1 to signal an error to the system
  exit 1
# Mark the end of the argument validation IF statement
fi

# Write the column headers to the file. The single '>' creates the file or overwrites it completely if it exists
echo "status,name,domain,timestamp" > ${OUTPUT_FILE}

# Run the ping command sending exactly 1 packet (-c 1) to the target domain.
# '&>' redirects both standard output and error messages to /dev/null to keep the terminal clean.
# The IF statement directly evaluates if the ping command finishes successfully (returns exit code 0).
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  # If the ping was successful, append (>>) a new line starting with "success" and the current date/time to the CSV file
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
# If the ping command fails (domain is down, invalid, or blocked), execute the following instead
else
  # Append a new line starting with "failure" and the current date/time to the CSV file
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
# Mark the end of the ping check IF-ELSE structure
fi

