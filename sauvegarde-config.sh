echo "Quel et le dossier a sauvegarder ? (media/partage)"
read dosssauv

echo "Quel et le dossier de destination ?(tmp)"
read dossdest

echo "Quel et le nom de la sauvegarde ?"
read name



cp -r /$dosssauv /$dossdest
tar -czvf /$dossdest/'date +%Y-%m-%d'$name.tar.gz /$dosssauv
