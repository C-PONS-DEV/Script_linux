# Script sauvegarde, et démarage automatique des regles Nftabes

# PONS Clément SIO SISR 2

apt-get install ifupdown
# Sauvegarde : 

echo 'Quel et le nom de votre table à sauvegarder ?'
read matable

nft list table $matable > /root/nftables.rules

# Application des règles au démarage :

rm /etc/network/interfaces

echo 'Quelle ip ?'
read ip
echo 'Quelle passerelle (gateway) ?'
read gateway
echo 'Nom de carte réseau ?'
read carte
echo 'Quelle ip pour la seconde interface ?'
read ip2
echo 'Quelle passerelle (gateway) ?'
read gateway2
echo 'Nom de seconde carte réseau ?'
read carte2

#1ere interface
echo "source /etc/network/interfaces.d/*" >> /etc/network/interfaces
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "allow-hotplug $carte" >> /etc/network/interfaces
echo "auto $carte" >> /etc/network/interfaces
echo "iface $carte inet static" >> /etc/network/interfaces
echo "address $ip" >> /etc/network/interfaces
echo "gateway $gateway" >> /etc/network/interfaces
echo "">> /etc/network/interfaces

ifup $carte

# 2nd interface
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "allow-hotplug $carte2" >> /etc/network/interfaces
echo "auto $carte2" >> /etc/network/interfaces
echo "iface $carte2 inet static" >> /etc/network/interfaces
echo "address $ip2" >> /etc/network/interfaces
echo "gateway $gateway2" >> /etc/network/interfaces
echo "">> /etc/network/interfaces
echo "">> /etc/network/interfaces
echo "pre-up nft –f /root/nftables/iptables.rules" >> /etc/network/interfaces

ifup $carte2

# Redemarrer 
echo "Configuration terminée, appuyez sur entrer pour redemarrer le système"

read tmpb

reboot