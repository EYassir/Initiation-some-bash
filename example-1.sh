#!/bin/bash 
 
echo "Entrez la ram à allouer :" 
read -r ram 
 
if [ "$ram" -ge 16 ]; then 
    echo "Beaucoup trop de ram" 
elif [ "$ram" -ge 14 ]; then 
    echo "Ram élevé" 
elif [ "$ram" -ge 12 ]; then 
    echo "Ram correct" 
elif [ "$ram" -ge 10 ]; then 
    echo "Ram Faible" 
else 
    echo "insuffisant" 
fi