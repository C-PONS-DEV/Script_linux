# Script sauvegarde, et démarage automatique des regles Nftabes

# PONS Clément SIO SISR 2

# Sauvegarde : 

echo 'Quel et le nom de votre table à sauvegarder ?'
read matable

nft list table $matable > /root/nftables.rules

# Application des règles au démarage :
rm /etc/nftables.conf

echo "flush ruleset" >> /etc/nftables.conf
echo /root/nftables.rules >> /etc/nftables.conf


# Redemarrer 
echo "Configuration terminée, appuyez sur entrer pour redemarrer le système"

read tmpb

reboot