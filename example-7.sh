echo "Saisir le group" 
read -r group 
cmd=$(cat /etc/group |awk -F":" '{print $1 " " $4}' | grep $group | awk '{print $2}')
for user in $cmd
do
   cat /etc/passwd | grep $user | awk -F":" '{print " User : " $1 " has_home : "$6 " and use " $NF " as shell "}'
done