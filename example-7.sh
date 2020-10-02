echo "Saisir le group" 
read -r group 
cmd=$(cat /etc/group |awk -F":" '{print $1 " " $4}' | grep $group | awk '{print $2}')

IFS=',' # quote is set as delimiter
read -ra ADDR <<< "$cmd" # str is read into an array as tokens separated by IFS
for user in $cmd
do
   cat /etc/passwd | grep $user | awk -F":" '{print " User : " $1 " has_home : "$6 " and use " $NF " as shell "}'
done