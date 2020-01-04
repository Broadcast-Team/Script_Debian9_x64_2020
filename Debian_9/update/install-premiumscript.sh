#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo ""
echo ""
echo ""

#Checking IP
#wget --quiet -O iplist.txt http://center.broadcast365.site/vps_2020/iplist.txt
wget --quiet -O iplist.txt https://raw.githubusercontent.com/Broadcast-Team/Script_Debian9_x64_2020/master/Debian_9/iplist.txt

flag=0

echo -e "${green}Connecting to Server...${NC}"
sleep 1
echo ""
echo -e "${green}Checking Permission...${NC}"
sleep 1
echo ""
echo -e "${green}Your IP Server : $myip${NC}"
sleep 1
echo ""
echo -e "${green}Checking Your IP Server...${NC}"
sleep 3

iplist="iplist.txt"
lines=`cat $iplist`

for line in $lines; do
if [ "$line" == "$myip" ]; 
then
flag=1
echo ""
echo -e "${green}IP address accepted!${NC}";
echo "" 
echo "" 
echo "          -----[WELCOME TO BLACK-TEAM™ PREMIUM SCRIPT]-----  "
echo "        ====================================================="
echo "        #            Telegram : @blackitsupport             #"
echo "        #       Copyright: © BLACK-TEAM™ Premium 2020       #"
echo "        ====================================================="
echo ""
echo ""
echo -e "${green}Permission Accepted...${NC}"
sleep 1.5
echo ""
echo "		==============================		"
echo "		Thanks for using our services.		"
echo "		==============================		"
echo ""
fi
done

if [ $flag -eq 0 ]
then
clear
echo ""
echo ""
echo -e "${red}Access denied!${NC}"
echo "                                                        				 "
echo "============================================================================"
echo -e "${red}Sorry, your ip address $myip is not register in our system.${NC}	  "
echo ""
echo -e "${green}Please contact your network administrator to access this service at 
telegram: @blackitsupport ${NC} 												  "
echo "============================================================================"

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
#wget -O premium-script.tar.gz "http://center.broadcast365.site/vps_2020/update/premium-script.tar.gz"
wget -O premium-script.tar.gz "https://github.com/Broadcast-Team/Script_Debian9_x64_2020/raw/master/Debian_9/update/premium-script.tar.gz"
tar -xvf premium-script.tar.gz
rm -f premium-script.tar.gz

cp /usr/local/bin/premium-script /usr/local/bin/menu

chmod +x /usr/local/bin/trial
chmod +x /usr/local/bin/user-add
chmod +x /usr/local/bin/user-aktif
chmod +x /usr/local/bin/user-ban
chmod +x /usr/local/bin/user-delete
chmod +x /usr/local/bin/user-detail
chmod +x /usr/local/bin/user-expire
chmod +x /usr/local/bin/user-limit
chmod +x /usr/local/bin/user-lock
chmod +x /usr/local/bin/user-login
chmod +x /usr/local/bin/user-unban
chmod +x /usr/local/bin/user-unlock
chmod +x /usr/local/bin/user-password
chmod +x /usr/local/bin/user-log
chmod +x /usr/local/bin/user-add-pptp
chmod +x /usr/local/bin/user-delete-pptp
chmod +x /usr/local/bin/alluser-pptp
chmod +x /usr/local/bin/user-login-pptp
chmod +x /usr/local/bin/user-expire-pptp
chmod +x /usr/local/bin/user-detail-pptp
chmod +x /usr/local/bin/bench-network
chmod +x /usr/local/bin/speedtest
chmod +x /usr/local/bin/ram
chmod +x /usr/local/bin/log-limit
chmod +x /usr/local/bin/log-ban
chmod +x /usr/local/bin/user-generate
chmod +x /usr/local/bin/user-list
chmod +x /usr/local/bin/diagnosa
chmod +x /usr/local/bin/premium-script
chmod +x /usr/local/bin/user-delete-expired
chmod +x /usr/local/bin/auto-reboot
chmod +x /usr/local/bin/log-install
chmod +x /usr/local/bin/menu
chmod +x /usr/local/bin/user-auto-limit
chmod +x /usr/local/bin/user-auto-limit-script
chmod +x /usr/local/bin/edit-port
chmod +x /usr/local/bin/edit-port-squid
chmod +x /usr/local/bin/edit-port-openvpn
chmod +x /usr/local/bin/edit-port-openssh
chmod +x /usr/local/bin/edit-port-dropbear
chmod +x /usr/local/bin/autokill
chmod +x /root/limit.sh
chmod +x /root/ban.sh
screen -AmdS limit /root/limit.sh
screen -AmdS ban /root/ban.sh
clear
cd
echo " "
echo " "
echo "Premium Script Successfully Updates!"
echo " "
rm -f /root/iplist.txt