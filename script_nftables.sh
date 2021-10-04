#Automatisation des ajouts de règles nftable parce que j'en peux plus
#Debian 11

#by loris

#Questions

echo "Quel est le nom du filtre concerné ?"
read filtre


# ADD OR DELETE

read -p "Quelle opération voulez-vous effectuer ? (add/delete)" choix1

case $choix1 in

        [Aa]dd ) add="v"; delete="f";;
        [Dd]el* ) delete="v"; add="f";;
        * ) echo "Réponse incorrecte.";;
esac


#IP OR PORT

read -p "L'opération concerne quoi ? (ip / port) " choix2

case $choix2 in
								[Ii][Pp] ) ip="v"; port="f";;
								[Pp]ort* ) port="v"; ip="f";;
								* ) echo "Réponse incorrecte"
								
esac



#Application

if [ $add = "v" ]
        then
					if [ $ip = "v" ]
						then
								echo "Quelle position doit avoir la règle ?"
								read pos
								echo "Quelle ip / plage voulez-vous utiliser ?(masque en cidr si plage ip)"
								read ipv4
								echo "Voulez-vous drop ou accept ?"
								read action
								
								nft add rule $filtre input position $pos ip saddr $ipv4 $action
								nft add rule $filtre input position $pos ip daddr $ipv4 $action
								
								nft add rule $filtre output position $pos ip saddr $ipv4 $action
								nft add rule $filtre output position $pos ip daddr $ipv4 $action
					fi

					if [ $port = "v" ]
						then
								echo "Quelle port voulez-vous utiliser ?"
								read portused
								echo "Quelle protocole de transport voulez-vous utiliser ?"
								read L4 #Layer 4
								echo "Voulez-vous drop ou accept ?"
								read action
								
								nft add rule $filtre input position $pos $L4 sport $portused $action
								nft add rule $filtre input position $pos $L4 dport $portused $action
								
								nft add rule $filtre output position $pos $L4 sport $portused $action
								nft add rule $filtre output position $pos $L4 dport $portused $action
					fi
fi

if [ $delete = "v" ]
        then
                     if [ $ip = "v" ]
						then
								echo ""
								nft -a list table $filtre
								echo ""
								
								echo "numéro handle input 1 ?"
								read handle1
								echo "numéro handle input 2 ?"
								read handle2
								echo "numéro  handle output 3 ?"
								read handle3
								echo "numéro  handle output 4 ?"
								read handle4
								
								nft delete rule $filtre input handle $handle1
								nft delete rule $filtre input handle $handle2
								
								nft delete rule $filtre output handle $handle3
								nft delete rule $filtre output handle $handle4
					fi
					
					if [ $port = "v" ]
						then
								echo ""
								nft -a list table $filtre
								echo ""
								
								echo "numéro handle input 1 ?"
								read handle1
								echo "numéro handle input 2 ?"
								read handle2
								echo "numéro  handle output 3 ?"
								read handle3
								echo "numéro  handle output 4 ?"
								read handle4
								
								nft delete rule $filtre input handle $handle1
								nft delete rule $filtre input handle $handle2
								
								nft delete rule $filtre output handle $handle3
								nft delete rule $filtre output handle $handle4
					fi
fi


#Sauvegarde

echo "P'tite save pour la fin ? (O/N)"
read save
case $save in

        [Oo]* ) save="v";;
        [Nn]* ) save="f";;
        * ) echo "Réponse incorrecte.";;
esac

if [ $save = "v" ]
	then 
			nft list table $filtre > /tmp/save$filtre.rules
			rm /etc/nftables.conf
			cp /tmp/savefiltre.rules /etc/nftables.conf

			echo "Sauvegarde terminée !"
	else
			echo "tant pis...."
fi
#the end