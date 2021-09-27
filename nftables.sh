# Script sauvegarde, et démarage automatique des regles Nftabes

# PONS Clément SIO SISR 2

# Sauvegarde : 

echo 'Quel et le nom de votre table à sauvegarder ?'
read matable

nft list table $matable > nftables.rules

# Application des règles au démarage :

rm /etc/network/interfaces

echo Quelle ip ?
read ip
echo Quelle Gateway ?
read gateway

echo source /etc/network/interfaces.d/* >> /etc/network/interfaces
echo auto lo >> /etc/network/interfaces
echo iface lo inet loopback >> /etc/network/interfaces
echo allow-hotplug enp0s3 >> /etc/network/interfaces
echo auto enp0s3 >> /etc/network/interfaces
echo iface enp0s3 inet static >> /etc/network/interfaces
echo address $ip >> /etc/network/interfaces
echo gateway $gateway >> /etc/network/interfaces
echo pre-up nft –f /root/nftables/iptables.rules