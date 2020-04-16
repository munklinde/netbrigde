#! /bin/sh
ip=$(/usr/bin/ifdata -pa enp0s9)
/usr/bin/python3 /home/lars/tcgui/main.py --ip $ip