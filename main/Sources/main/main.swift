import classe


// ------------------------- fonction utile pour le programme principal --------------------------


// attaquer : Carte x Carte x Int ->
// fonction executant l'ordre d'attaque emit par le joueur si celle si est possible(respectant les regles du jeu)
// Pre : a et c doit etre de type Carte
// Resultat : si l'attaque était possible, soit la carte a été detruite, soit elle a été capturée soit des points de dégats on été enregistré pour cette carte (pour le tour actuel)

func attaquer(posdef : laposition, posatt : laposition, tour : Int) {
    let cdba = posdef.cdb()

    if let c = posdef.carte(){// s'il y a une carte a la position de la defense
        if let a = posatt.carte(){ // s'il y a une carte a la position attaquante
            
            if a.peutAttaquer(c : c) { // on verifie que la carte qui attaque peut bien attaquer la carte cible (vis a vis de la portee) 
                a.changerMode() // la carte a est mise en position offensive pour attaquer 
                if a.valeurAttaque() == c.valeurDefense() {
                    c.capturerCarte(attaquant : a) // la carte est capture vers le royaume de l'attaquant
                    cdba.avancerCarte(p : posdef) // avance la carte de deriere si la carte capturée est sur le front et si il y a une carte deriere celle-ci
                }
                
                else if  a.valeurAttaque() > c.valeurDefense(){
                    cdba.cimetiere(c : c) // la carte est detruite, elle est donc envoye vers le cimetiere
                    cdba.avancerCarte(p : posdef) // avance la carte de deriere si la carte tuée est sur le front et si il y a une carte deriere celle-ci
                }
                else {
                    c.ajoutPointDegat(d : a.valeurAttaque(), t : tour) // on enregistre les points de degats pour le tour actuel
                    if c.pointDegat(t : tour) > c.valeurDefense() {
                        cdba.cimetiere(c : c) // la carte est detruite, elle est donc envoye vers le cimetiere
                    }
                }
            }
            else {
                print("Pas d'attaque, la carte defensive n'est pas a portée de la carte attaquante")
            }
        }
        else{
            print("Pas d'attaque, la position attaquante est vide")
        }
    }
    else {
        print("Pas d'attaque, la position de defense est vide")
    }
}


// conscription : champsDeBataille -> Bool
// fonction executant une conscrition si le champs de bataille d'un joueur est vide si cette conscription est possible
// Pre : c doit etre de type champsDeBataille
// Resultat : si la conscription est possible, le champs de bataille n'est plus vide sinon le joueur perd la partie
func conscription( c : le_champs_de_bataille, p : laposition) -> Bool{
    if c.royaume().nbCarteRoyaume() != 0 { // si le royaume n'est pas vide alors on peut lui enlever un citoyen
        var pos = p
        while !p.estVide(){
            print("La position choisie n'est pas vide : choisissez une autre position")
            pos = saisiePosition(cdb : c)
        }
        c.envoyerCarte(p : pos) // on enleve la carte la plus ancienne du royaume pour la mettre sur le champ de bataille 
        return true
    }
    else if !(c.main.nbDeCarteMain() == 0) {
        print("vous devez mettre une carte sur la ligne de front") // c'est le joueur adverse qui va choisir quelle carte il pose et a quel endroit
        print(afficher(m : c.main))
        print ("Choisissez votre carte")
        let carte = saisieCarte(m : c.main)
        var position = p
        while !position.estVide() || position.arriere() {
            print("La position choisie n'est pas vide : choisissez une autre position")
            position = saisiePositionFront(cdb : c)
        } 
        c.main.poserCarte(cdb : c, c : carte, pos : position)
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
    print(afficher(m : m))
    print ("Choisissez le role de la carte que vous voulez poser")
    var carte = readLine()  
    var erreurSaisie = false // servira pour les gerer les ereur de saisie des joueurs
    var bonneSaisie = false // servira pour les gerer les ereur de saisie des joueurs
    while !erreurSaisie { // tant que la saisie n'est pas de un role d'une carte que le joueur possede on redemande une saisie
        if (carte == nil) && !(carte == "Archer" || carte == "Garde" || carte == "Soldat" || carte == "Roi") {
            print("la carte saisie n'existe pas, veuillez saisir a nouveau")
            carte = readLine()
            bonneSaisie = false
        }
        else {
            bonneSaisie = true
        }
        if bonneSaisie && !m.avoirMain(r : carte!) {
            print("Vous n'avez pas cette carte dans votre main, choisissez un autre role. Voila votre main :")
            print(afficher(m : m))
            carte = readLine()
            bonneSaisie = false
        }
        else{
            erreurSaisie = true
        }

    }
    return carte!
}


// saisiePositionFront() : -> Position
// fonction gerant la saisie d'une position ainsi que les erreur lié a cette saisie
// Resultat : renvoie la position saisie et cette position est sur le front
func saisiePositionFront(cdb : le_champs_de_bataille) -> laposition {
    print("Champs de bataille")
    print(afficher(c : cdb))
    print("Choisissez une position")
    var pos = readLine()
    while (pos != nil) && !(pos == "F1" || pos == "F2" || pos == "F3"){
        print("Vous devez choisir une position parmi F1, F2, F3")
        pos = readLine()
    }
    var position : laposition? = nil
    for p in cdb.position() {
        if pos == p.nom(){
            position = p
        }
    }
    return position!
}


// saisiePosition() : -> Position
// fonction gerant la saisie d'une position ainsi que les erreur lié a cette saisie
// Resultat : renvoie le nom de la position saisie
func saisiePosition(cdb : le_champs_de_bataille) -> laposition {
    print("Champs de bataille")
    print(afficher(c : cdb))
    print("Choisissez une position")
    var pos = readLine()
    while !(pos == "F1" || pos == "F2" || pos == "F3" || pos == "A1" || pos == "A2" || pos == "A3"){
        print("Vous devez choisir une position parmi F1, F2, F3, A1, A2, A3")
        pos = readLine()
    }
    var position : laposition? = nil
    for p in cdb.position() {
        if pos == p.nom(){
            position = p
        }
    }
    return position!
}


// saisieBool :  -> Bool
// fonction gerant la saisie d'un booleen 
// Resulat : renvoie un booleen
func saisieBool() -> Bool {
    var a = readLine()
    var b : Bool = false
    var fini : Bool = false
    while !fini{
        if a == "true"{
            b = true
            fini = true
        }
        else if a == "false"{
            b = false
            fini = true
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
    while (a != nil) && !( a == "ne rien faire" || a == "deployer une unite" || a == "attaquer"){
        print("vous devez choisir : ne rien faire, deployer une unite ou attaquer")
        a = readLine()
    }
    return a!
}

// afficher : Champsdebataille -> String
// fonction affichant la composition (position et carte sur ces positions)
// pré le paramètre est du type Champsdebataille
// Résultat : composition du champs de bataille sous forme de String facilement compréhensible par l'utilisateur
func afficher(c : le_champs_de_bataille) -> String {
    var str = ""
    for p in c.position() {
        if p.estVide() {
            str += p.nom() + " : Vide, "
        }
        else {
            str += p.nom() + " : " + p.carte()!.roleCarte() + ", "
        }
        if p.nom() == "A3"{
            str+="\n"
        }
    }

    return str
}

// afficher la main
func afficher(m : lamain) -> String {
    var str = "Votre main est :\n"

    for c in m.listeCarteMain(){
        str += c.roleCarte() + ", "
    }

    return str
}



// -------------------- PROGRAMME PRINCIPAL -------------------------------



// commencer le jeu
var joueur1 = true   // joueur1 est vivant
var joueur2 = true   // joueur2 est vivant

var pioche1 = pioche(j : 1)!  // pioche du joueur 1 généré 
var pioche2 = pioche(j : 2)!  // pioche du joueur 2 généré

var main1 = lamain(num : 1)! // initialisation de la main du joueur 1 avec le roi1
var main2 = lamain(num : 2)! // initialisation de la main du joueur 2 avec le roi2

var royaume1 = leroyaume() // initialisation du royaume vide pour le joueur 1
var royaume2 = leroyaume() // initialisation du royaume vide pour le joueur 2

var champsdebataille1 = le_champs_de_bataille( j : 1, r : royaume1, m : main1) // initialisation du champs de bataille vide pour le joueur 1
var champsdebataille2 = le_champs_de_bataille( j : 2, r : royaume2, m : main2) // initialisation du champs de bataille vide pour le joueur 2




// ----------------------   MISE EN PLACE DE LA PARTIE  ------------------------------
print("La partie commence")
//initialisation de la partie
pioche1.piocher(lieu : main1, nb : 3) // on place 3 cartes de la pioche du joueur 1 dans sa main
pioche2.piocher(lieu : main2, nb : 3) // on place 3 cartes de la pioche du joueur 2 dans sa main
pioche1.piocher(lieu : royaume1, nb : 1) // on place une carte dans le royaume du joueur 1
pioche2.piocher(lieu : royaume2, nb : 1) // on place une carte dans le royaume du joueur 2
print("le joueur1 doit mettre une carte sur la ligne de front")
var carte = saisieCarte(m : main1)
var position = saisiePositionFront(cdb : champsdebataille1)
main1.poserCarte(cdb : champsdebataille1, c : carte, pos : position) // On prend une carte présente dans main1 qu'on doit placer sur la ligne de front. Cette carte est alors supprimer de main1
print("le joueur2 doit mettre une carte sur la ligne de front")
carte = saisieCarte(m : main2)
position = saisiePositionFront(cdb : champsdebataille2)
main2.poserCarte(cdb : champsdebataille2, c : carte, pos : position) // On prend une carte présente dans main2 qu'on doit placer sur la ligne de front. Cette carte est alors supprimer de main2


var tourActuel = 1



//------------------ ENCHAINEMENT DES TOURS DE JEUX --------------------


while (joueur1 && joueur2) && (!pioche1.estVidePioche()  || !pioche2.estVidePioche()){ // tant que les deux rois sont en vie et que l'un des deux joueurs a des cartes dans sa pioche, on continue la partie
    
    print("------------------ Au tour du joueur1 -------------------")
    // Phase de préparation ------
    for pos in champsdebataille1.position() { //carte() {   // on place toutes ses cartes en position defensive
        if (pos.carte() != nil) && (pos.carte()!.estOffensive()){
            pos.carte()!.changerMode()
        }
    }
    pioche1.piocher(lieu : main1, nb : 1)
    
    // Phase d'action ---------
    print(" Quelle action voulez vous faire : ne rien faire, deployer une unite ou attaquer")
    let action = saisieAction()
    if action == "ne rien faire"{
        // rien ne se passe
    }
    else {
        if action == "attaquer"{
            var continuer = true
            while continuer && joueur2{ // tant que le joueur veux attaquer on continuer la phase d'attaque. Si jamais le roi du joueur2 meurt alors la partie s'arrete
                print("Quel est votre cible ? Ecrivez sa position")
                let cible = saisiePosition(cdb : champsdebataille2)
                print("Avec quelle unite ? Ecrivez sa position")
                let attaquant = saisiePosition(cdb : champsdebataille1)
                attaquer(posdef : cible, posatt : attaquant, tour : tourActuel) // on attaque la cible avec l'unite demande si possible
                if champsdebataille2.estVide(){
                    print("\nJoueur 2, votre champs de battaille est vide, faites rentrer une carte de votre royaume sur votre champs de bataille:")
                    joueur2 = conscription(c : champsdebataille2, p : saisiePosition(cdb : champsdebataille2))
                    print("------------------------ Retour au joueur 1 ----------------------------")
                }
                print("Si vous voulez continuer a attaquer ecrivez true, false sinon")
                continuer = saisieBool()
            }
        }
        else {
            print("Selectionner une carte a mettre sur le champ de bataille")
            let carte = saisieCarte(m : main1)
            print("Choisissez une position")
            let position = saisiePosition(cdb : champsdebataille1)
            main1.poserCarte(cdb : champsdebataille1, c : carte, pos : position)// On prend une carte présente dans main1 qu'on doit placer sur une position possible(si il y a deja une carte a cette position, la carte revient dans sa main). Cette carte est alors supprimer de main 1.
        }
    }
    
    // Phase de developpement --------
    if joueur2 {  // si le roi du joueur2 a été tuer, pas la peine de faire une phase de developpement
        if main1.nbDeCarteMain() > 5 {
            print("Vous devez envoyer une carte au royaume, laquelle choisisez vous :")
            carte = saisieCarte(m : main1)
            royaume1.envoyerCarte(c : carte, m : main1) // Envoie d'une carte de sa main dans le royaume
        }
        else {
            print("Voulez vous mettre une de vos carte au royaume ? Si oui ecrivez true, false sinon ")
            let reponse = saisieBool()
            if reponse{
                carte = saisieCarte(m : main1)
                royaume1.envoyerCarte(c : carte, m : main1) // Envoie d'une carte de sa main dans le royaume
            }
        }
        
    }
    
    
    
    
    //----- TOUR JOUEUR2 ----
    
    
    
    if joueur2 {
        print(" --------------------------- Au tour du joueur2 ------------------------------- ")
        // Phase de préparation ------
        for pos in champsdebataille2.position(){//carte() { // on place toutes ses cartes en position defensive
            if (pos.carte() != nil) && pos.carte()!.estOffensive(){
                pos.carte()!.changerMode()
            }
        }
        pioche2.piocher(lieu : main2, nb : 1)
        
        // Phase d'action ---------
        print(" Quelle action voulez vous faire : ne rien faire, deployer une unite ou attaquer")
        let action = saisieAction()
        if action == "ne rien faire"{
            // rien ne se passe
        }
        else {
            if action == "attaquer"{
                var continuer = true
                while continuer && joueur1{ // tant que le joueur veux attaquer on continuer la phase d'attaque
                    print("Quel est votre cible ? Ecrivez sa position")
                    let cible = saisiePosition(cdb : champsdebataille1)
                    print("Avec quel unite ? Ecrivez sa position")
                    let attaquant = saisiePosition(cdb : champsdebataille2)
                    attaquer(posdef : cible, posatt : attaquant, tour : tourActuel) // on attaque la cible avec l'unite demande si possible
                    if champsdebataille2.estVide(){
                        print("\nJoueur 1, votre champs de battaille est vide, faites rentrer une carte de votre royaume sur votre champs de bataille:")
                        joueur1 = conscription(c : champsdebataille1, p : saisiePosition(cdb : champsdebataille1))
                        print("------------------- Retour au joueur 2 -------------------")
                }
                print("Si vous voulez continuer a attaquer ecrivez true, false sinon")
                continuer = saisieBool()
                }
            }
            else {
                print("Selectionner une carte a mettre sur le champ de bataille")
                let carte = saisieCarte(m : main2)
                print("Choisissez une position")
                let position = saisiePosition(cdb : champsdebataille2)
                main2.poserCarte(cdb : champsdebataille2,c : carte, pos : position) // On prend une carte présente dans main1 qu'on doit placer sur une position possible(si il y a deja une carte a cette position, la carte revient dans sa main). Cette carte est alors supprimer de main 1.
            }
        }
        
        // Phase de developpement --------
        if joueur1 {
            if main1.nbDeCarteMain() > 5 {
                print("Vous devez envoyer une carte au royaume, laquelle choisisez vous :")
                carte = saisieCarte(m : main2)
                royaume2.envoyerCarte(c : carte, m : main2) // Envoie d'une carte de sa main dans le royaume
            }
           else {
                print("Voulez vous mettre une de vos carte au royaume ? Si oui ecrivez true, false sinon ")
                let reponse = saisieBool()
                if reponse{
                    carte = saisieCarte(m : main2)
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
else if royaume1.nbCarteRoyaume() > royaume2.nbCarteRoyaume(){
    print("Felicitations ! Le joueur 1 a gagné !")
    }
else if royaume1.nbCarteRoyaume() < royaume2.nbCarteRoyaume(){
    print("Felicitations ! Le joueur 2 a gagné !")
    }
else {
    print("Egalité !!!!!!")
    }
