#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

red='\e[1;31m'
               green='\e[0;32m'
               NC='\e[0m'
			   
               echo "Connecting to Blackteam.net..."
               sleep 0.5
               
			   echo "Checking Permission..."
               sleep 0.5
               
			   echo "${green}Permission Accepted...${NC}"
               sleep 1
flag=0
	
#iplist="ip.txt"
wget --quiet -O iplist.txt http://center.broadcast365.site/vps_2020/iplist.txt

#if [ -f iplist ]
#then
iplist="iplist.txt"
lines=`cat $iplist`
#echo $lines
for line in $lines; do
#        echo "$line"
        if [ "$line" = "$myip" ];
        then
flag=1
fi
done

if [ $flag -eq 0 ]
then
echo  "Sorry, only registered IP @ Password can use this script! 
Contact: IT-Center / Black Team IT Support at telegram: @blackitsupport"

rm -f /root/iplist.txt
exit 1
fi

cd
sed -i '$ i\screen -AmdS limit /root/limit.sh' /etc/rc.local
sed -i '$ i\screen -AmdS ban /root/ban.sh' /etc/rc.local
sed -i '$ i\screen -AmdS limit /root/limit.sh' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS ban /root/ban.sh' /etc/rc.d/rc.local
echo "0 0 * * * root /usr/local/bin/user-expire" > /etc/cron.d/user-expire
echo "0 0 * * * root /usr/local/bin/user-expire-pptp" > /etc/cron.d/user-expire-pptp

cat > /root/ban.sh <<END3
#!/bin/bash
#/usr/local/bin/user-ban
END3

cat > /root/limit.sh <<END3
#!/bin/bash
#/usr/local/bin/user-limit
END3

cd /usr/local/bin
wget -O premium-script.tar.gz "http://center.broadcast365.site/vps_2020/update/premium-script.tar.gz"
tar -xvf premium-script.tar.gz
rm -f premium-script.tar.gz

cp /usr/local/bin/premium-script /usr/local/bin/menu

chmod +x /usr/local/bin/*

screen -AmdS limit /root/limit.sh
screen -AmdS ban /root/ban.sh
clear
cd
echo " "
echo " "
echo "Premium Script Successfully Updates!"
echo " "
rm -f /root/iplist.txt