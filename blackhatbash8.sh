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
cat newlog1.txt
sed '1d' newlog.txt > newlogd.txt
cat newlogd.txt
sed '$d' newlog.txt > newlogl.txt
cat newlog1.txt
sed '5,7d' newlog.txt > newlog57.txt
cat newlog57.txt
sed -n '2,15 p' log.txt
sed -i '1d' log.txt
sleep 100 &
#[1] 23964
ps -ef | grep sleep
#root           1       0  0 12:14 ?        00:00:00 /bin/sh -c echo Container started trap "exit 0" 15  exec "$@" while sleep 1 & wait $!; do :; done -
#root       23964     709  0 13:13 pts/2    00:00:00 sleep 100
#root       24157       1  0 13:13 ?        00:00:00 sleep 1
#root       24168     709  0 13:13 pts/2    00:00:00 grep --color=auto sleep
jobs
#[1]+  Ejecutando                 sleep 100 
fg %1
#sleep 100
CTRL-Z sleep 100
#[1]+  Detenido                   sleep 100
bg %1
#[1]+ sleep 100&