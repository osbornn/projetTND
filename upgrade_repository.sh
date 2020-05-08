git pull
printf "Vuoi forzare aggiornamento repository? (s/n)\n"
read -r decisione
if [ $decisione == 's' ]
then
  git reset --hard HEAD
  git pull
else
   printf "Repository aggiornata correttamente"
fi
