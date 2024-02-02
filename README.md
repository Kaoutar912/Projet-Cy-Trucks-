# Projet-Cy-Trucks-

# Introduction
Developpement d'un projet de traitement de données en Bash avec tri fait par un programme C (Tri via AVL).

# Objectif du Projet
L'utilisateur va lancer le programme en donnant le fichier de données en entrée et en spécifiant plusieurs arguments concernant le type de données qu'il souhaite visualiser (voir ci-dessous les arguments disponibles).

##Les options disponibles : 

-Option -d1 : Identifie les conducteurs avec le plus grand nombre de trajets. Génère un fichier temporaire contenant les résultats et crée un graphique horizontal basé sur ces données. 

-Option -d2 : Identifie les conducteurs avec les trajets de plus grande distance. Génère un fichier temporaire et un graphique horizontal basé sur ces données. 

-Option -l : Identifie les conducteurs avec les trajets les plus longs en termes de distance. Génère un fichier temporaire, un graphique vertical, et stocke dans le dossier “images”.

-Option -t : Identifie le nombre de trajets parcourus dans chaque ville, ainsi que le nombre de fois où ces villes ont été des villes de départ de trajets. Fait appel au programme C et crée un graphique de type histogramme regroupé. 

-Option -s : Identifie les distances minimales, moyennes et maximales des étapes, pour chaque trajet. Fait également appel au programme C et crée un graphique de type courbes min-max-moyenne.

Ces options sont exclusives entre elles. Cela signifie qu’une seule option à la fois peut être activée au maximum.

Cependant, si l'option que vous mettez lors de la compilation est différente de celle ci-dessus le programme ne l'a comptera pas et compilera comme si vous n'aviez pas mis d'option. Il compilera de manière général (cas général).


## Specifications de tris :

Il est possible d’imposer le mode de tri des données : soit à l’aide d’un tableau (ou liste chaînée), soit à l’aide d’une structure d’arbre binaire, ABR ou AVL.
Si aucune option de tri n’est activée, par défaut le tri se fera à l’aide d’un AVL qui sera la plus efficace et qui est celle demndée et utilisée dans le projet.

- --tab : tri effectué à l’aide d’une structure linéaire (au choix un tableau
ou une liste chaînée)
- --abr : tri effectué l’aide d’une structure de type ABR
- --avl : tri effectué à l’aide d’une structure de type AVL

Les arguments et options du script [FICHIER] :
Le nom du fichier d’entrée doit être renseigné pour que le script puisse acquérir toutes les données. Cette option est obligatoire.
- -f <nom_fichier> : (f)ichier d’entrée.


# Exemple de lancement du fichier
Dès que vous avez téléchargé le projet, n'oubliez pas de telecharger le document data.csv et de le rajouter au dossier pour compiler. Veuillez penser à compiler où le dossier data.csv est enregistré (se rendre dans le chemin grâce à la commande "cd") 
 
Avant tout il faut télécharger "gnuplot" sur votre terminal à l'aide des commandes suivantes
```
sudo apt-get update
sudo apt-get install gnuplot
```
Il est aussi nécessaire d'avoir la fonction gawk à jour. Si ce n'est pas le cas, téléchargez-la à l'aide de la commande suivante
```
sudo apt-get install gawk
```
 Pour toutes compilations, il est préférable de suivre la méthode suivante
```
./projet.sh data/data.csv -les options que vous souhaitez
```
Option -d1
```
./projet.sh data/data.csv -d1
```
Option -d2
```
./projet.sh data/data.csv -d2
```
Option -l
```
./projet.sh data/data.csv -l
```
Option -t
```
./projet.sh data/data.csv -t
```
Option -s
```
./projet.sh data/data.csv -s
```
Cependant, si vous rencontrez des difficultés pour compiler aidez-vous de l'option suivante 
```
./meteo.sh --help
```
Elle vous permettra d'obtenir l'affichage d'un aide détaillé à l'utilisation du script. Dès que vous n'en aurez plus l'utilité, il vous suffira d'appuyer sur la touche "q" de votre clavier pour recompiler
