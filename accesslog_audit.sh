#!/bin/bash

printf "\nStart running script, please wait...\n"

##### Task 1
grep GET access.log > requested_uri.txt
cut -d " " -f7 requested_uri.txt > URL.txt
sort URL.txt | uniq -c | sort -nr > top_uri.txt
printf "\nTop 10 requested urls sorted by hits\nhits:   uri:\n"
head top_uri.txt

##### Task 2
cut -d " " -f1 access.log | tail -n +2 > IP.txt
sort IP.txt | uniq -c | sort -nr > top_clicks.txt
printf "\nTop 10 visitors by ip sorted by hits\nhits:   ip:\n"
head top_clicks.txt

##### Task 3
cut -d / -f2,3 access.log | cut -c 1-8 | tail -n +2 > hits_per_month.txt
uniq -c hits_per_month.txt > total_hits_per_month.txt
awk '{print $2 " hits count - " $1}' total_hits_per_month.txt > monthly_hits_structured.txt
sed -i 's/\// /' monthly_hits_structured.txt
printf "\nTotal hits per month sorted by month\n"
cat monthly_hits_structured.txt 

##### Task 4
paste -d " " hits_per_month.txt IP.txt  > ip_visits.txt
sort -nr ip_visits.txt | uniq | cut -d " " -f1 | sort | uniq -c | sort -t"/" -k2.4n -k1.9M > unique_ip_month.txt
awk '{print $2 " unique visits - " $1}' unique_ip_month.txt > monthly_unique_ips_structured.txt
sed -i 's/\// /' monthly_unique_ips_structured.txt
printf "\nUnique visits (by ip) per month\n"
cat monthly_unique_ips_structured.txt

##### Task 5
sort -nr ip_visits.txt | uniq -c | sort -t"/" -k2.4n -k1.9M -k1nr > sorted_records_month.txt
awk '{ split($2,array,"[/]"); print > array[1] "_" array[2] ".tmp" }' sorted_records_month.txt
ls *201*.tmp | sort -t '_' -k 2.4n -k 1.1M > sorted_tmp_files.txt
xargs -0 head < <(tr \\n \\0 <sorted_tmp_files.txt) > top_ten_ips.txt
sed -i 's/==> //' top_ten_ips.txt
sed -i 's/.tmp <==//' top_ten_ips.txt
sed -i 's/_/\t_/' top_ten_ips.txt
sed -i 's/_/_\t/' top_ten_ips.txt
printf "\nTop 10 ips barchart per month\n"
awk '{print $1, $3}' top_ten_ips.txt

##### Task 6
grep -e "robots.txt" -e "access.log" access.log > apache2_vulnerabilities.txt
grep -e "system32" -e "/etc/passwd" access.log > remote_executables.txt
grep -e "wp-login" -e "wp-admin" -e "wp-content" access.log > wordpress_attacks.txt
grep -e "SELECT" -e "UNION" -e "NULL" access.log > sql_injection.txt
printf "\nPOSSIBLE HACKING ATTEMPT: Check the following logs apache2_vulnerabilities.txt remote_executables.txt wordpress_attacks.txt sql_injection.txt\n"

##### Cleanup
rm -f top_ten_ips.txt sorted_tmp_files.txt sorted_records_month.txt monthly_unique_ips_structured.txt unique_ip_month.txt ip_visits.txt monthly_hits_structured.txt total_hits_per_month.txt hits_per_month.txt top_clicks.txt IP.txt top_uri.txt URL.txt requested_uri.txt

printf "\nRunning script DONE\n"