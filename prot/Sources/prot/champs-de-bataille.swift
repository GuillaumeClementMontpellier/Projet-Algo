// champs de bataille

public protocol champsdebatailleProtocol {
    
associatedtype positionProtocol
associatedtype carteProtocol
associatedtype royaumeProtocol
associatedtype mainProtocol
    
    
	// init? : Int -> Champsdebataille
    // renvoit un champs de bataille initialisé avec 6 positions vides correspondant aux 6 positions du jeu
    init (j : Int, r : royaumeProtocol, m : mainProtocol)

	//ajouterUneCarte : Champsdebataille x Position x Carte ->
	// pre : il faut que la carte soit disponible dans le main
	// pre : il faut que la position soit vide sinon il faut enlever echanger les cartes et mettre la carte du champs de bataille dans la main du joueur
	// post : il faut enlever la carte de la main du joueur quand il la pose sur le champs de bataille
    mutating func ajouterUneCarte (p : positionProtocol, c : carteProtocol)

    
	// supprimerCarte : Champsdebataille x Carte ->
	// pré : il faut que la carte à enlever soit bien sur le terrain
	// post : la carte retiré du terrain va dans le royaume
    mutating func supprimerCarte (c : carteProtocol)


	// avancerCarte : Champsdebataille x Position ->
    // pré : le paramètre p est la position qui est vide
	// si la position est au front : la fonction avance la carte situé à l'arriere de cette position si il y a une carte 
    //      si non rien ne se passe
    mutating func avancerCarte(p : positionProtocol)


	// estVide : Champsdebataille -> Bool // fonction permettant de savoir si le chams de bataille est vide
    func estVide () -> Bool  
    

	// estVidePosition : Champsdebataille x Position -> Bool
	// pré : il faut que la positon existe 
	// pré : position est un string 
    func estVidePosition(p : positionProtocol) -> Bool

    
    // position : Champsdebataille -> [Position]  // renvoit toutes position du champs de bataille sous forme de tableau
    // pré : champsdebataille est du type Champsdebataille
    func position () -> [positionProtocol]
    
    
	// obtenirCarte : Champsdebataille x Positon -> Carte 		//permet de connaitre une carte dans la position donné sans l'enlever
	// pré : position existe et c'est un string
    func obtenirCarte (p : positionProtocol) -> carteProtocol
    
    // royaume : Champsdebataille -> Royaume
    // renvoit le royaume du champs de bataille pris en paramètre
    // pré : il faut que le champs de bataille et le royaume soient créés
    func royaume () -> royaumeProtocol
    
    
    // cimetiere : Carte ->
    // fonction permettant supprimer une carte et donc de considérer qu'on la envoyé au cimetiere
    // pré : carte est de type Carte et position est de type Position
    mutating func cimetiere (c : carteProtocol)
    
    
    // envoyerCarte : Champsdebataille x Carte ->
    // Pre : c est une carte qui est dans la main du joueur qui a ce champs de bataille
    // fonction qui prendra une carte du royaume ou de la main et qui va envoyer cette carte sur le champs de bataille (conscription)
    mutating func envoyerCarte (p : positionProtocol)
    
}
