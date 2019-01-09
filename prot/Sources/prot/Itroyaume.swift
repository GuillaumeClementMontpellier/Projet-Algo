import Foundation

// Itroyaume 

protocol ItRoyaume : IteratorProtocol{
    

    associatedtype royaumeProtocol
    associatedtype carteProtocol

    //init : Royaume -> Self
    // creation d'un iterateur pour un royaume tel que les cartes seront trié par leur odre d'entrée dans le royaume
    // Pre : r doit etre de type Royaume
    init(r : royaumeProtocol)
    
    // next : -> Carte?
    // fonction avancant vers le prochain element et le retourne ou retourne nil si le prochain element n'existe pas (si la suite est vide)
    mutating func next() ->  carteProtocol?
}
