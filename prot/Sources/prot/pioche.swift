import Foundation

// pioche

protocol piocheProtocol {
    
    associatedtype mainProtocol
    associatedtype royaumeProtocol
    
    // init? : -> Self
    // la pioche est créée avec 9 soldats, 6 gardes et 5 archers et elle est générée aléatoirement
	init? ()


	// piocher : Pioche x Main x Int
	// pré : il faut que la pioche soit créée
	// pré : il faut que les cartes soient créées
	// pré : il faut que l'entier rentrée en paramètre doit etre soit 1 soit 3
    // post : il faut enlever la carte de la pioche une fois qu'elle est piochée
    //      : la carte enlevée de la pioche doit etre ajouté dans la main et le nb de role de cette carte doit etre incrémenter dans la main
    mutating func piocher(lieu : mainProtocol, nb : Int)
    
    
    // piocher : Pioche x Royaume x Int
    // pré : il faut que la pioche soit créée
    // pré : il faut que les cartes soient créées
    // pré : il faut que l'entier rentrée en paramètre doit etre soit 1 soit 3
    // post : il faut enlever la carte de la pioche une fois qu'elle est piochée
    //      : la carte enlevée de la pioche doit etre ajouté dans le Royaume
    mutating func piocher(lieu : royaumeProtocol, nb : Int)
    
    

	// nbCartePioche : Pioche -> String
	// pré : 
    // fonction renvoyant le nombre de carte présente dans la pioche sous forme d'un Int
	func nbCartePioche () -> Int  
    
    
    // estVidePioche : Pioche -> Bool 
    // fonction permettant de savoir si la pioche est vide 
    func estVidePioche () -> Bool  
}
