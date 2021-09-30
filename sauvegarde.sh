mysqldump --user=shovon --password=123 --all-databases > /tmp/sauvegarde.sql

echo "" >> /tmp/sauvegarde.log

echo "-------------" >> /tmp/sauvegarde.log

echo "" >> /tmp/sauvegarde.log

echo "`date +%Y-%m-%d__%Hh%M` : Début de la sauvegarde" >> /tmp/sauvegarde.log

echo "`date +%Y-%m-%d__%Hh%M` : Début de la sauvegarde"

tar -czvf Archive_`date +%Y-%m-%d`.tar.gz /tmp/sauvegarde.sql

cp Archive_`date +%Y-%m-%d`.tar.gz /tmp

rm Archive_`date +%Y-%m-%d`.tar.gz

echo "`date +%Y-%m-%d__%Hh%M` : Sauvegarde terminee... Supression de sauvegarde.sql" >> /tmp/sauvegarde.log

echo "`date +%Y-%m-%d__%Hh%M` : Sauvegarde terminee... Supression de sauvegarde.sql"

echo "" >> /tmp/sauvegarde.log

echo "-------------" >> /tmp/sauvegarde.log

read -p "Appuyer sur une touche pour continuer..."

rm /tmp/sauvegarde.sql
