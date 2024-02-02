#!/bin/bash
#rapport, repartition des taches (+ ou -)
# Vérification des arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <chemin_fichier_csv> <option>"
    exit 1
fi

# Récupération de l'argument
fichier_csv="$1"
option="$2"

# Vérification de l'existence du fichier CSV
if [ ! -f "$fichier_csv" ]; then
    echo "Erreur : Le fichier $fichier_csv n'existe pas."
    exit 2
fi

# Vérification de l'existence des dossiers temp et images
mkdir -p temp
mkdir -p images

# Nettoyage du dossier temp
rm -rf temp/*

# Exécution du traitement en fonction de l'option
if [ "$option" == "-h" ]; then
    echo "Options disponnibles : "
    echo "-d1 : Conducteurs avec le plus de trajets "
    echo "-d2 : Conducteurs avec le plus long trajets "
    echo "-l : Les plus long trajets "
    echo "-t : Les 10 villes les plus traversées "
    echo "-s : Les statistiques sur les étapes "
    
elif [ "$option" == "-d1" ]; then
    # Traitement D1 : Conducteurs avec le plus de trajets
    echo "Traitement D1 : Conducteurs avec le plus de trajets"

    # Calcul du temps d'exécution
    start_time=$(date +%s)
    
    awk -F';' '$2 == 1 {conducteurs[$6]++} END {for (conducteur in conducteurs) print conducteurs[conducteur], conducteur}' "$fichier_csv" | sort -k1,1nr | head -n 10 | awk -F' ' '{print $2 " " $3 ";" $1}' > temp/Option-d1.txt

  
    # Génération du graphique horizontal D1
    gnuplot gp/horizontal_bar_d1.gp
    
    # Affichage du temps d'exécution
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    echo "Temps d'exécution du traitement D1 : $elapsed_time secondes"

elif [ "$option" == "-d2" ]; then
    # Traitement D1 : Conducteurs avec le plus de trajets
    echo "Traitement D2 : Conducteurs avec le plus long trajets"

    # Calcul du temps d'exécution
    start_time=$(date +%s)

    awk -F';' '{conducteurs2[$6]+=$5} END {for (conducteur2 in conducteurs2) print conducteurs2[conducteur2], conducteur2}' "$fichier_csv" | sort -k1,1nr | head -n 10 | awk -F' ' '{print $2 " " $3 ";" $1}' > temp/Option-d2.txt

  
    # Génération du graphique horizontal D2
    gnuplot gp/horizontal_bar_d2.gp
    
    # Affichage du temps d'exécution
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    echo "Temps d'exécution du traitement D2 : $elapsed_time secondes"

elif [ "$option" == "-l" ]; then
    # Traitement L : Conducteurs avec le plus long trajets
    echo "Traitement L : Les plus long trajets"

    

    # Calcul du temps d'exécution
    start_time=$(date +%s)
    awk -F';' '{somme_etapes[$1]+=$5} END {for (trajet in somme_etapes) print trajet, somme_etapes[trajet]}' "$fichier_csv" | sort -k2,2nr | head -n 10 | sort -n -k1 | awk '{print $1 ";" $2}'> temp/Option-l.txt


    # Génération du graphique
    cat << __EOF | gnuplot -persist
    set title "Option -l : Distance =f(Route)"
    set xlabel "ROUTE ID"
    set ylabel "DISTANCE (KM)"
    set datafile separator ";"
    set boxwidth 0.7
    set style fill solid
    set term pngcairo size 1000,1000
    set output 'images/Option-l.png'
    plot 'temp/Option-l.txt' using 2:xtic(1) notitle with boxes lc rgb "0x78e5ae"
__EOF


    # Affichage du temps d'exécution
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    echo "Temps d'exécution du traitement L : $elapsed_time secondes"
    
    elif [ "$option" == "-t" ]; then
    # Traitement L : Conducteurs avec le plus long trajets
    echo "Traitement L : Les plus long trajets"

    

    # Calcul du temps d'exécution
    start_time=$(date +%s)
        awk -F';' '{conducteurs3[$3]+=$2} END {for (conducteur3 in conducteurs3) print conducteurs3[conducteur3], conducteur3}' "$fichier_csv" | sort -k1,1nr | head -n 10 | awk -F' ' '{print $2 " ;" $3 ";" $1}' > temp/Option-t.txt


    # Génération du graphique
    cat << __EOF | gnuplot -persist
    set title "Option -t : Nb routes =f(Towns)"
    set xlabel "TOWN NAMES"
    set ylabel "NB ROUTES"
    set datafile separator ";"
    set xtic rotate by 45 right
    set boxwidth 0.4
    set style fill solid
    set term pngcairo size 1000,1000
    set output 'images/Option-t.png'
    plot 'temp/Option-t.txt' using 2:xtic(1) title "Total routes" with boxes lc rgb "0x78e5ae"#, \
         #'temp/Option-t.txt' using 2:xtic(1) title "Frist town" with boxes lc rgb "0x56e5ae"
__EOF


    # Affichage du temps d'exécution
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    echo "Temps d'exécution du traitement L : $elapsed_time secondes"
    
else
    echo "Option non reconnue : $option"
    exit 3
fi

exit 0
