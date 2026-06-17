#!/usr/bin/env bash
awk '{print $1,$NF}' log.txt
awk '{print $1}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt
awk '{print $1,$NF}' log.txt
awk '{print $NF}' log.txt
awk -F',' '{print $1}' example_csv.txt
awk 'NR < 10' log.txt
head log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'
sed 's/Mozilla/Godzilla/g' log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep -o "Godzilla" newlog.txt #This command searches for the exact word "Godzilla" within the newlog.txt file and, thanks to the -o option, extracts and displays on the screen only that word each time it finds it, ignoring the rest of the text in the affected lines.
grep -o "Mozilla" log.txt #It is configured to search for the term "Mozilla" within the log.txt file. When executed, the system will scan the entire document and return a clean list containing only the word "Mozilla" for each instance it is detected in the text.
sed 's/ //g' log.txt > newlog1.txt
