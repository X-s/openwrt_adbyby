#!/bin/sh
clear
echo " "
echo "Welcome to use Auto Adbyby Install"
echo "Author: Xs"
echo "Email: xsmumu@gmail.com"
echo " "
while :
do
	echo "-----------------------------------------"
	echo "1 - Install Openwrt-MTK7620A 7620N Adbyby"
	echo "2 - Install Openwrt-AR71XX AR913X Adbyby"
	echo "3 - Uninstall Openwrt-Adbyby"
	echo "4 - Exit"
	echo "-----------------------------------------"
	read select
	
	case $select in
		1) clear;
			echo "Install Openwrt-MTK7620A 7620N Adbyby";
			wget http://info.adbyby.com/download/7620n.tar.gz;
			mkdir adbyby;
			tar -xzvf 7620n.tar.gz -C adbyby;
			echo "Remove old version";
			rm -rf /usr/bin/adbyby;
			rm -rf /etc/init.d/adbyby;
			rm -rf /etc/rc.d/S90adbyby;
			echo "Install adbyby";
			mv adbyby /usr/bin/adbyby;
			mv init_adbyby /etc/init.d/adbyby;
			chmod a+x /etc/init.d/adbyby;
			chmod a+x /usr/bin/adbyby/adbyby;
			echo "Start service";
			/usr/bin/adbyby/adbyby;
			iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8118;
			echo "Clean tmp";
			rm -rf openwrt_adbyby.sh;
			rm -rf 7620n.tar.gz;
			#add rc.d symlinks
			cd /etc/rc.d;
			ln -s ../init.d/adbyby S90adbyby;
			echo "Done!";
			exit;;
			
		2) clear;
			echo "Install Openwrt-AR71XX AR913X Adbyby";
			wget http://info.adbyby.com/download/openwrt.tar.gz;
			mkdir adbyby;
			tar -xzvf openwrt.tar.gz -C adbyby;
			mv adbyby/bin/* adbyby/;
			rm -rf adbyby/bin/
			echo "Remove old version";
			rm -rf /usr/bin/adbyby;
			rm -rf /etc/init.d/adbyby;
			rm -rf /etc/rc.d/S90adbyby;
			echo "Install adbyby";
			mv adbyby /usr/bin/adbyby;
			mv init_adbyby /etc/init.d/adbyby;
			chmod a+x /etc/init.d/adbyby;
			chmod a+x /usr/bin/adbyby/adbyby;
			echo "Start service";
			/usr/bin/adbyby/adbyby;
			iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8118;
			echo "Clean tmp";
			rm -rf openwrt_adbyby.sh;
			rm -rf openwrt.tar.gz;
			#add rc.d symlinks
			cd /etc/rc.d;
			ln -s ../init.d/adbyby S90adbyby;
			echo "Done!";
			exit;;
			
		3) clear;
			echo "Uninstall Openwrt-Adbyby";
			rm -rf /usr/bin/adbyby;
			rm -rf /etc/init.d/adbyby;
			rm -rf /etc/rc.d/S90adbyby;
			iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8118;
			echo "Done!";
			exit;;
			
		4) echo "GoodBye!!!"; 
			exit;;
		
	esac
done
