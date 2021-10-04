#by Clément PONS

apt install wget

echo "Quel est l'url a télécharger' ?"
read url

cd Download/
wget $url

echo "Le téléchargement est terminé"