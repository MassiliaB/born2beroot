#!/bin/bash

arch=$(uname -a)
cpu=$(cat /proc/cpuinfo | grep cpu\ core | uniq | awk '{print $4}')
vcpu=$(cat /proc/cpuinfo | grep processor | wc -l)
mem=$(free -h | grep Mem | awk '{print $7}')
perc=$(free -m | grep Mem | awk '{print (100 * $3) / $2}')
disk=$(df -h --output=avail --total | awk 'END {print $1}')
percd=$(df -h --total | awk 'END {print  (100 * $3) / $2}')
cpul=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf"%.1f%%\n", $1 + $3}')
boot=$(who -b | awk '{print $3, $4}')
output=$(lsblk | grep "lvm" | wc -l)
lvm=$(if [ $output -eq 0 ]; then echo no; else echo yes; fi)
tcp=$(netstat -a | grep 'tcp' | wc -l)
usrlog=$(users | wc -l)
ip=$(hostname -I)
mac=$(ip addr | grep ether | awk '{print $2}')
sudo=$(journalctl _COMM=sudo | wc -l)

wall "	#Architecture: $arch
	#CPU physical: $cpu
	#vCPU: $vcpu
	#Free Memory Usage: $mem ($perc%)
	#Disk Usage: $disk ($percd%)
	#CPU load: $cpul
	#Last boot: $boot
	#LVM use: $lvm
	#Connexion TCP: $tcp ESTABLISHED
	#User log: $usrlog
	#Network: IP $ip ($mac)
	#Sudo: $sudo cmd"
