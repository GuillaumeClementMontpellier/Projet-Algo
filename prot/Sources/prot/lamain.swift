import Foundation

//main 

protocol mainProtocol {
    
associatedtype champsdebatailleProtocol
associatedtype positionProtocol
associatedtype carteProtocol
    
	// init? : Int -> Main
	// renvoit une main en fonction de l'entier rentré en paramètre, si l'entier rentré est 1 on créé une main avec le roi 1, si l'entier rentré est 2 on créé une main avce le roi 2. Si l'entier n'est pas 1 ou 2 la création échoue.
    // pré : Int == 1 ou Int == 2
    init? (num : Int)
    
    
	// nbDeCarteMain : Main -> Int
	// pré : il faut que le main soit créée 
	// pré : il faut que les cartes existent
	// post : renvoit le nombre de carte présente dans la main du joueur
	func nbDeCarteMain () -> Int  

    
	// poserCarte : Main x Champdebataille x String x Position ->      //prend une carte de la main du joueur et la pose sur le champs de bataille, la fonction supprime la carte prise en paramètre de la main
	// pré : il faut que le main soit créée
	// pré : il faut que c le role la carte existe dans la main
	// pré : il faut que le joueur ai la carte dans sa main 
	// pré : il faut que le String corresponde a un role d'une carte (Archer, soldat ....)
	// post : une carte dont la fonction est c n'est plus dans la main
    mutating func poserCarte (cdb : champsdebatailleProtocol, c : String, pos : positionProtocol)


	// listeCarteMain : Main -> Carte           // fonction permettant de savoir quelles cartes a le joueur
	// pré : il faut que le main soit créée  
	// pré : il faut que la carte existe
	func listeCarteMain () -> [carteProtocol]


	// ajouterCarteMain : Main x Carte 
	// pré : il faut que la main soit créée 
	// pré : il faut que la carte existe 
	// pré : carte est de type Carte
	// pré : main est de type main 
	mutating func ajouterCarteMain (c : carteProtocol)
    
    // avoirMain : Main x String -> Champsdebataille
    // Pre : m est de type main
	// pré : il faut que le String corresponde a un role d'une carte (Archer, soldat ....)
    // Resultat : true si il y a une carte ayant ce role dans la main, false sinon
    func avoirMain(r : String) -> Bool
}

