#!/bin/sh
echo " "
echo "Welcome to use Auto Adbyby Install for 7620n"
echo "Author: Xs"
echo "Email: jye1107@qq.com"
echo " "
echo "Now will download adbyby package and install"
wget http://info.adbyby.com/download/7620n.tar.gz
mkdir adbyby
tar -xzvf 7620n.tar.gz -C adbyby
rm -rf /usr/bin/adbyby
mv -f adbyby /usr/bin/adbyby
rm -rf 7620n.tar.gz
chmod a+x /usr/bin/adbyby/adbyby
/usr/bin/adbyby/adbyby &
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8118
mv init_adbyby /etc/init.d/adbyby
chmod a+x /etc/init.d/adbyby
echo "Done!"