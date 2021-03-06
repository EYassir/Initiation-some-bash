#!/bin/bash 
 
choix=0 
i=0 

until [ "$choix" -lt 0 ]; do 
    echo "1 - Créer un utilisateur : " 
    echo "2 - Modifier les groupe d'un utilisateur : " 
    echo "3 - Afficher les informations d'un utilisateur " 
    echo "4 - Modifier le mot de passe d'un utilisateur " 
    echo "Que souhaitez vous faire (q pour quitter) : " 
    read -r choix 
    if [ "$choix" = "q" ]; then 
        choix=-1 
        i=$((i+1))
        echo "===> Fin d'execution aprés $i essais !" 
    elif [ "$choix" -eq 1 ]; then 
        i=$((i+1))
        echo "===>  Création d'un utilisateur ...." 
        echo "===>   Enter le login de l'utilisateur"
        read -r login
        echo "===>   Enter le home de l'utilisateur"
        read -r home
        echo "===>   Enter le password de l'utilisateur"
        read -r passwd
        echo "===>   Enter le(s) groupe de l'utilisateur"
        read -r groups
        if [ $login -eq "" ]||[ $home -eq "" ]||[ $passwd -eq "" ]||[ $groups -eq "" ]; then
            echo "error"
        else
            sudo useradd $login --password $passwd --home $home --create-home --groups $groups --shell /bin/bash
            echo "===>   Utilisateur $login créés !"
        fi
    elif [ "$choix" -eq 2 ]; then 
        i=$((i+1))
        echo "===>  Modification des groupe d'un utilisateur..." 
        echo "===>  Enter le login de l'utilisateur"
        read -r login
        if  grep "^$login:" /etc/passwd > /dev/null ; then 
            echo "===>   L'utilisateur existe" 
            echo "===>   Enter le(s) groupe de l'utilisateur"
            read -r groups
            if [ $groups !="" ]; then
                usermod -AG $groups $login
            fi
        else 
            echo "===>   L'utilisateur n'existe pas" 
        fi 
    elif [ "$choix" -eq 3 ]; then
        i=$((i+1))
        echo "===>  Récupération des information d'un utilisateur...." 
        echo "===>  Enter le login de l'utilisateur"
        read -r login
        cat /etc/passwd | grep $login
    elif [ "$choix" -eq 4 ]; then 
        i=$((i+1))
        echo "===>  Modification du mot de passe d'un utilisateur...." 
        echo "===>  Enter le login de l'utilisateur"
        read -r login
        passwd $login
    else 
        i=$((i+1))
        echo "===> Fin d'execution aprés $i essais !" 
    fi 
done 
