import Foundation

// ce fichier contient le type abstrait correspondant à une position sur le champs de bataille

public protocol positionProtocol {
    
associatedtype carteProtocol
associatedtype champsdebatailleProtocol
 	
    // init String : -> Position
    // création d'une position, initialisé vide et de nom F1, F2, F3, A1, A2 ou A3
    
    init(n : String, cdb : champsdebatailleProtocol)

    
    // estVide : position -> Bool
    // fonction renvoie true si une position est vide, false sinon
    // Pre : la position doit exister sur le champs de bataille
    func estVide () -> Bool
    

    // nom : Position -> String
    // fonction retournant le nom de la postion, cad F1, F2, F3, A1, A2 ou A3
    // Pre : pos est de type Position$
    func nom() -> String  
    

    // carte : Position -> (Carte|Vide)
    // fonction renvoyant la carte qui est sur cette position si cette postion n'est pas vide
    // Pre : pos est de type Position et !pos.EstVide()
    func carte() -> carteProtocol?

    // front : Position -> Bool
	// pré : p est de type Position 
    func front () -> Bool  		// renvoie true si elle est au front et false sinon


	// arriere : Position -> bool
	// pré : p est de type Position 
    func arriere () -> Bool 	// renvoie true si elle est en arrière et false sinon


    // cdb : Position -> ChampDeBataille
	// fonction retournant le champs de bataille possedant la position
	// Pre : cette position doit etre sur un champs de bataille
	// Resultat : c est de type Position
	func cdb() -> champsdebatailleProtocol
}
