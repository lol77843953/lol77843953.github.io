# ---------------------------------------------------
# Script: Basic Security & Port Hardening
# Author: lol77843953
# Target: MikroTik RouterOS v6.x / v7.x
# ---------------------------------------------------

/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
set ssh port=2222
set winbox port=8291

/ip firewall filter
add action=drop chain=input comment="Drop Invalid connections" connection-state=invalid
add action=accept chain=input comment="Allow Established & Related" connection-state=established,related
add action=accept chain=input comment="Allow Admin Access (Winbox)" dst-port=8291 protocol=tcp
add action=drop chain=input comment="Drop all other input"
