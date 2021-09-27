# Script sauvegarde, et démarage automatique des regles Nftabes

# PONS Clément SIO SISR 2

# Sauvegarde : 

echo 'Quel et le nom de votre table ?'
read matable

nft list table $matable > nftables.rules

# Application des règles au démarage :

rm /etc/network/interfaces
