# Transparent network mainipulator
## Ablility to manipulate upstream and downstream traffic independently

![Using tcgui](https://github.com/tum-lkn/tcgui/blob/master/tcgui.png)![Overview](overview.JPG)

## Needed software:
- I've used a Ubuntu deriviate [Bodhi Linux](https://www.bodhilinux.com/)
- Removed packages: nplan netplan netplant.io networkmanager
- Added tcGui project: https://github.com/tum-lkn/tcgui.git
- Added deb-packages: ifupdown iproute2 dnsmasq python3 python3-flask 


## Descriptions
The bridge has 3 network cards.
- Top one, in my setup "enp0s9" for generel access and control of the bridge. Should have a static IP or dns-name to be able to find it and ensure stabel connection even in a remotely deployed setup.
- Left one, in my setup "enp0s3" (bridged)
- Righ one, in my setup "enp0s8" (bridged)

Left- and right network cards are bridged using std. linux ip-forwarding and iptables routing.
See the files [routing_on.sh](routing_on.sh) and [routing_off.sh](routing_off.sh) 

Both right and left network cards are configured with the installed dhcp server (dnsmasq) to support:
- Any esisting VM with any OS can joing this setup just by adding an extra network card and connect it to the switch
- Routing information is automatically distributed via the DHCP server, so that left-hand and right-hand networks know of each others existance and traffic travels through the bridge
- DNS servives can be provided as well through the dnsmasq configuration if you prefere not using ip addresses in your tests

## Nice2knows
### Enable IP4 forwarding temporarily
- sudo sysctl -w net.ipv4.ip_forward=1
- Or sudo echo 1 > /proc/sys/net/ipv4/ip_forward

### Enable IP4 forwarding permanently
- Edit /etc/sysctl.conf with your favorite editor
- Find the line starting with "#net.ipv4.ip_forward=1"
- Uncomment the line by removing the first character "#"
- Exit & save the file
