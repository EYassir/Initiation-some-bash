#!/bin/bash 
 
choix=0 
i=0 

until [ $choix -lt 0 ]; do 
    echo "1 - Créer un utilisateur : " 
    echo "2 - Modifier les groupe d'un utilisateur : " 
    echo "3 - Afficher les informations d'un utilisateur " 
    echo "4 - Modifier le mot de passe d'un utilisateur " 
    echo "Que souhaitez vous faire (q pour quitter) : " 
    read -r choix 
    if [ $choix = "q" ]; then 
        choix=-1 
        i=$((i+1))
        echo "****************************************"
        echo "===> Fin d'execution aprés $i essais !" 
        echo "****************************************"
    elif [ $choix -eq 1 ]; then 
        i=$((i+1))
        echo "****************************************"
        echo "===>  Création d'un utilisateur ...." 
        echo "****************************************"
    elif [ $choix -eq 2 ]; then 
        i=$((i+1))
        echo "****************************************"
        echo "===>  Modification des groupe d'un utilisateur..." 
        echo "****************************************"
    elif [ $choix -eq 3 ]; then
        i=$((i+1))
        echo "****************************************"
        echo "===>  Récupération des information d'un utilisateur...." 
        echo "****************************************"
    elif [ $choix -eq 4 ]; then 
        i=$((i+1))
        echo "****************************************"
        echo "===>  Modification du mot de passe d'un utilisateur...." 
        echo "****************************************"
    else 
        i=$((i+1))
        echo "****************************************"
        echo "===> Fin d'execution aprés $i essais !" 
        echo "****************************************"
    fi 
done 
