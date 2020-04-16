
Enable IP4 forwarding temporarily
- sudo sysctl -w net.ipv4.ip_forward=1
  or
  sudo echo 1 > /proc/sys/net/ipv4/ip_forward

Enable IP4 forwarding permanently
- Edit /etc/sysctl.conf with your favorite editor
- Find the line starting with "#net.ipv4.ip_forward=1"
- Remove the first character "#"
- Exit & save the file
