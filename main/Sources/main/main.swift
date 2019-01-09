import class

import Foundation

// ------------------------- fonction utile pour le programme principal --------------------------


// attaquer : Carte x Carte x Int ->
// fonction executant l'ordre d'attaque emit par le joueur si celle si est possible(respectant les regles du jeu)
// Pre : a et c doit etre de type Carte
// Resultat : si l'attaque était possible, soit la carte a été detruite, soit elle a été capturée soit des points de dégats on été enregistré pour cette carte (pour le tour actuel)

func attaquer(c : carte, a : carte, tour : Int){
    if a.peutAttaquer( cible : c) { // on verifie que la carte qui attaque peut bien attaquer la carte cible (vis a vis de la portee) 
        a.changerMode() // la carte a est mise en position offensive pour attaquer 
        var pos = c.position()
        var cdba = c.cdb()  // on stock les deux valeurs parce que une fois detruite ou captué on n'aura plus acces a ces information
        if a.valeurAttaque() == c.valeurDefense() {
            var pos = c.position()
            c.capturerCarte(attaquant : a) // la carte est capture vers le royaume de l'attaquant
            cdb.avancerCarte(p : pos) // avance la carte de deriere si la carte capturée est sur le front et si il y a une carte deriere celle-ci
        }
    }
    else if  a.valeurAttaque() > c.valeurDefense(){
        var pos = c.position()
        c.cdb().cimetiere() // la carte est detruite, elle est donc envoye vers le cimetiere
        cdba.avancerCarte(p : pos) // avance la carte de deriere si la carte tuée est sur le front et si il y a une carte deriere celle-ci
    }
    else {
        c.ajoutPointDegat(d : a.valeurAttaque, t : tour) // on enregistre les points de degats pour le tour actuel
        if c.pointDegat(t : tourActuel) > c.valeurDefense() {
            c.cdb().cimetiere() // la carte est detruite, elle est donc envoye vers le cimetiere
        }
    }
        
}


// conscription : champsDeBataille -> Bool
// fonction executant une conscrition si le champs de bataille d'un joueur est vide si cette conscription est possible
// Pre : c doit etre de type champsDeBataille
// Resultat : si la conscription est possible, le champs de bataille n'est plus vide sinon le joueur perd la partie
func conscription( c : le_champs_de_bataille) -> Bool{
    if !c.royaume().estVide(){ // si le royaume n'est pas vide alors on peut lui enlever un citoyen
        c.envoyerCarte(c : c.royaume.premiereCarte()) // on enleve la carte la plus ancienne du royaume pour la mettre sur le champ de bataille 
        return true
    }
    else if !c.main().estVide(){
        print("le joueur adverse doit mettre une carte sur la ligne de front") // c'est le joueur adverse qui va choisir quelle carte il pose et a quel endroit
        print(c.main())
        print ("Choisissez votre carte")
        var carte = saisieCarte()
        print("Choisissez une position")
        var position = saisiePosition(cdb : c)
        c.main().poserCarte(cdb : c, pos : position, c : carte )
        return true
    }
    else {
        return false
    }
}

// saisieCarte : Main -> String
// fonction gerant la saisie d'une carte ainsi que les erreur que la saisie pourait faire
// Pre : m est de type Main
// Resultat : on renvoie un role valide pour poserCarte
func saisieCarte(m : lamain) -> String {
    print(m)
    print ("Choisissez le role de la carte que vous voulez poser")
    var carte = readLine()  
    var erreurSaisie = false // servira pour les gerer les ereur de saisie des joueurs
    var bonneSaisie = false // servira pour les gerer les ereur de saisie des joueurs
    while !erreurSaisie { // tant que la saisie n'est pas de un role d'une carte que le joueur possede on redemande une saisie
        if !(carte is String) && !(carte == "Archer" || carte == "Garde" || carte == "Soldat" || carte == "Roi") {
            print("la carte saisie n'existe pas, veuillez saisir a nouveau")
            carte = readLine()
            bonneSaisie = false
        }
        else {
            bonneSaisie = true
        }
        if bonneSaisie && !m.AvoirMain(c : carte) {
            print("Vous n'avez pas cette carte dans votre main, choisissez un autre role. Voila votre main :")
            print(m)
            carte = readLine()
            bonneSaisie = false
        }
        else{
            erreurSaisie = true
        }

    }
    return carte
}


// saisiePositionFront() : -> Position
// fonction gerant la saisie d'une position ainsi que les erreur lié a cette saisie
// Resultat : renvoie la position saisie et cette position est sur le front
func saisiePositionFront(cdb : le_champs_de_bataille) -> laposition {
    print("Choisissez une position")
    var pos = readLine()
    while !(pos is String) && !(pos == "F1" || pos == "F2" || pos == "F3"){
        print("Vous devez choisir une position parmi F1, F2, F3")
        pos = readLine()
    }
    for p in position.cdb() {
        if pos == p.nom(){
            var position = p
        }
    }
    return position
}


// saisiePosition() : -> Position
// fonction gerant la saisie d'une position ainsi que les erreur lié a cette saisie
// Resultat : renvoie la position saisie
func saisiePosition(cdb : le_champs_de_bataille) -> String {
    print("Choisissez une position")
    var pos = readLine()
    while (pos is String) && !(pos == "F1" || pos == "F2" || pos == "F3" || pos == "A1" || pos == "A2" || pos == "A3"){
        print("Vous devez choisir une position parmi F1, F2, F3, A1, A2, A3")
        pos = readLine()
    }
    for p in position.cdb() {
        if pos == p.nom(){
            var position = p
        }
    }
    return position
}


// saisieBool :  -> Bool
// fonction gerant la saisie d'un booleen 
// Resulat : renvoie un booleen
func saisieBool() -> Bool {
    var a = readLine()
    var b : Bool
    while (a is String) && ((a == "false") || (a == "true")){
        if a == "true"{
            b = true
        }
        else if a == "false"{
            b = false
        }
        else {
        print("Vous devez ecrire true ou false")
        a = readLine()
        }
    }
    return b
}

// saisieAction() : -> String
// fonction gerant la saisie d'une action (ne rien faire, deployer une unite ou attaquer)
// Resultat : renvoie un String qui est soit "ne rien faire" soit "deployer une unite" ou soit "attaquer"
func saisieAction() -> String {
    var a = readLine()
    while (a is String) && !( a == "ne rien faire" || a == "deployer une unite" || a == "attaquer"){
        print("vous devez choisir : ne rien faire, deployer une unite ou attaquer")
        a == readLine()
    }
}

// afficher : Champsdebataille -> String
// fonction affichant la composition (position et carte sur ces positions)
// pré le paramètre est du type Champsdebataille
// Résultat : composition du champs de bataille sous forme de String facilement compréhensible par l'utilisateur
func afficher(c : le_champs_de_bataille) -> String {
    var str = ""
    for p in c.position() {
        if p.estVide() {
                    str += p.nom() + " : Vide"
        }
        else {
            str += p.nom() + " : " + p.carte().roleCarte()
        }
    }
}



// -------------------- PROGRAMME PRINCIPAL -------------------------------



// commencer le jeu
var joueur1 = true   // joueur1 est vivant
var joueur2 = true   // joueur2 est vivant

var pioche1 = pioche()  // pioche du joueur 1 généré 
var pioche2 = pioche()  // pioche du joueur 2 généré

var main1 = lamain(num : 1) // initialisation de la main du joueur 1 avec le roi1
var main2 = lamain(num : 2) // initialisation de la main du joueur 2 avec le roi2

var royaume1 = leroyaume() // initialisation du royaume vide pour le joueur 1
var royaume2 = leroyaume() // initialisation du royaume vide pour le joueur 2

var champsdebataille1 = le_champs_de_bataille() // initialisation du champs de bataille vide pour le joueur 1
var champsdebataille2 = le_champs_de_bataille() // initialisation du champs de bataille vide pour le joueur 2




// ----------------------   MISE EN PLACE DE LA PARTIE  ------------------------------
print("La partie commence")
//initialisation de la partie
pioche1.piocher(lieu : main1,nb : 3) // on place 3 cartes de la pioche du joueur 1 dans sa main
pioche2.piocher(lieu : main2,nb : 3) // on place 3 cartes de la pioche du joueur 2 dans sa main
pioche1.piocher(lieu : royaume1, nb : 1) // on place une carte dans le royaume du joueur 1
pioche2.piocher(lieu : royaume2,lieu : 1) // on place une carte dans le royaume du joueur 2
print("le joueur1 doit mettre une carte sur la ligne de front")
var carte = saisieCarte(m : main1)
var position = saisiePositionFront(cdb : champsdebataille1)
main1.poserCarte(cdb : champsdebataille1,pos : position, c : carte) // On prend une carte présente dans main1 qu'on doit placer sur la ligne de front. Cette carte est alors supprimer de main1
print("le joueur2 doit mettre une carte sur la ligne de front")
var carte = saisieCarte(m : main2)
var position = saisiePositionFront(cdb : champsdebataille2)
main2.poserCarte(cdb : champsdebataille2,pos : position, c : carte) // On prend une carte présente dans main2 qu'on doit placer sur la ligne de front. Cette carte est alors supprimer de main2


var tourActuel = 1



//------------------ ENCHAINEMENT DES TOURS DE JEUX --------------------


while (joueur1 && joueur2) && (!pioche1.estVide()  || !pioche2.estVide()){ // tant que les deux rois sont en vie et que l'un des deux joueurs a des cartes dans sa pioche, on continue la partie
    
    print("Au tour du joueur1")
    // Phase de préparation ------
    for carte in champsdebataille1.carte() { // on place toutes ses cartes en position defensive
        if carte.estOffensive(){
            carte.changerMode()
        }
    }
    main1.piocher(nb : 1)
    
    // Phase d'action ---------
    print(" Quelle action voulez vous faire : ne rien faire, deployer une unite ou attaquer")
    var action = saisieAction()
    if action == "ne rien faire"{
        // rien ne se passe
    }
    else {
        if action == "attaquer"{
            var continuer = true
            print(afficher(c :champsdebataille1))
            print(afficher(c : champsdebataille2))
            while continuer && joueur2{ // tant que le joueur veux attaquer on continuer la phase d'attaque. Si jamais le roi du joueur2 meurt alors la partie s'arrete
                print("Quel est votre cible ? Ecrivez sa position")
                var cible = saisiePosition(cdb : champsdebataille2)
                print("Avec quel unite ? Ecrivez sa position")
                var attaquant = saisiePosition(cdb : champsdebataille1)
                attaquer(c : carte.cible(), a : carte.attaquant(),tour : tourActuel) // on attaque la cible avec l'unite demande si possible
                if champsdebataille2.estVide(){
                    joueur2 = conscription(c : champsdebataille2)
                }
                print("Si vous voulez continuer a attaquer ecrivez true, false sinon")
                continuer = saisieBool()
            }
        }
        else {
            print("Selectionner une carte a mettre sur le champ de bataille")
            var carte = main1.saisieCarte()
            print("Choisissez une position")
            var position = saisiePosition(cdb : champsdebataille1)
            main1.poserCarte(cdb : champsdebataille1,pos : position, c : carte) // On prend une carte présente dans main1 qu'on doit placer sur une position possible(si il y a deja une carte a cette position, la carte revient dans sa main). Cette carte est alors supprimer de main 1.
        }
    }
    
    // Phase de developpement --------
    if joueur2 {  // si le roi du joueur2 a été tuer, pas la peine de faire une phase de developpement
        if main1.nbcarte(main1) > 5 {
            print("Vous devez envoyer une carte au royaume, laquelle choisisez vous :")
            carte = main1.saisieCarte()
            royaume1.envoyerCarte(c : carte, m : main1) // Envoie d'une carte de sa main dans le royaume
        }
        else {
            print("Voulez vous mettre une de vos carte au royaume ? Si oui ecrivez true, false sinon ")
            var reponse = saisieBool()
            if reponse{
                carte = saisieCarte(m : main1)
                royaume1.envoyerCarte(c : carte, m : main1) // Envoie d'une carte de sa main dans le royaume
            }
        }
        
    }
    
    
    
    
    //----- TOUR JOUEUR2 ----
    
    
    
    if joueur2 {
        print("Au tour du joueur1")
        // Phase de préparation ------
        for carte in champsdebataille2.carte() { // on place toutes ses cartes en position defensive
            if carte.estOffensive(){
                carte.changerMode()
            }
        }
        main2.piocher(nb : 1)
        
        // Phase d'action ---------
        print(" Quelle action voulez vous faire : ne rien faire, deployer une unite ou attaquer")
        var action = saisieAction()
        if action == "ne rien faire"{
            // rien ne se passe
        }
        else {
            if action == "attaquer"{
                var continuer = true
                print(afficher(c : champsdebataille1))
                print(afficher(c : champsdebataille2))
                while continuer && joueur1{ // tant que le joueur veux attaquer on continuer la phase d'attaque
                    print("Quel est votre cible ? Ecrivez sa position")
                    var cible = saisiePosition(cdb : champsdebataille1)
                    print("Avec quel unite ? Ecrivez sa position")
                    var attaquant = saisiePosition(cdb : champsdebataille2)
                    attaquer(c : carte.cible(), a : carte.attaquant(),tour : tourActuel) // on attaque la cible avec l'unite demande si possible
                    if champsdebataille2.estVide(){
                        joueur2 = conscription(c : champsdebataille1)
                }
                print("Si vous voulez continuer a attaquer ecrivez true, false sinon")
                continuer = saisieBool()
                }
            }
            else {
                print("Selectionner une carte a mettre sur le champ de bataille")
                var carte = saisieCarte(m : main2)
                print("Choisissez une position")
                var position = saisiePosition(cdb : champsdebataille2)
                main2.poserCarte(cdb : champsdebataille2,pos : position, c : carte) // On prend une carte présente dans main1 qu'on doit placer sur une position possible(si il y a deja une carte a cette position, la carte revient dans sa main). Cette carte est alors supprimer de main 1.
            }
        }
        
        // Phase de developpement --------
        if joueur1 {
            if main1.nbcarte() > 5 {
                print("Vous devez envoyer une carte au royaume, laquelle choisisez vous :")
                carte = saisieCarte(m : main2)
                royaume2.envoyerCarte(c : carte, m : main2) // Envoie d'une carte de sa main dans le royaume
            }
           else {
                print("Voulez vous mettre une de vos carte au royaume ? Si oui ecrivez true, false sinon ")
                var reponse = saisieBool()
                if reponse{
                    carte = main2.saisieCarte()
                    royaume2.envoyerCarte(c : carte, m : main2) // Envoie d'une carte de sa main dans le royaume
                }
            }
        }
        
    }
    tourActuel += 1    
}



if joueur1 && !joueur2 {
    print("Felicitations ! Le joueur 1 a gagné !")
}
else if joueur2 && !joueur1 {
    print("Felicitations ! Le joueur 2 a gagné !")
    }
else if royaume1.nbCarte() > royaume2.nbCarte(){
    print("Felicitations ! Le joueur 1 a gagné !")
    }
else if royaume1.nbCarte() < royaume2.nbCarte(){
    print("Felicitations ! Le joueur 2 a gagné !")
    }
else {
    print("Egalité !!!!!!")
    }
