#! /bin/bash
printf "Date-Time\t\tWeb\tDBCon\tMemory\tCPU[avg]\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "\t%.2f%%\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
WEB=$(netstat -an|grep ':80\|:443'|wc -l)
DBCON=$(netstat -an| grep :5432|wc -l|awk '{printf "\t%s", $1}')
DT=$(date +%Y%m%d-%T | awk '{printf "%s\t", $1}')
echo "$DT$WEB$DBCON$MEMORY$CPU"
sleep 2
done
