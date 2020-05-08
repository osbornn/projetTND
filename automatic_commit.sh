git pull
git add projet.Rmd
printf "Vuoi scrivere un messaggio particolare nel tuo commit? (s/n)\n"
read -r messaggio
if [ $messaggio == 's' ]
then
   printf "Scrivi qui sotto il tuo messaggio che apparirà nel commit \n"
   read -r messaggioVeroEProprio
   git commit -m "${messaggioVeroEProprio}"
else
   git commit -m "ultimo aggiornamento del file del progetto"
fi
git push