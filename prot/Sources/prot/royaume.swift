import Foundation

// royaume 

public protocol royaumeProtocol : Sequence {
    
    associatedtype carteProtocol
    associatedtype mainProtocol
    associatedtype ItRoyaume


    // init : -> Royaume
    // création d'un royaume initialisé vide
    // Resultat : création d'une instance de type Royaume
    init()
    
    // makeItRoyaume : Royaume -> ItRoyaume
    // fonction permettant de créer un itérateur sur les cartes en les ordonant par leur odre d'entrée dans le royaume
    func makeItRoyaume () -> ItRoyaume
    
    
    // envoyerCarte : Royaume x String x Main
    // envoie la carte de la main dans le royaume
    // pré : carte est de type carte et le joueur doit posséder la carte dans sa main
    // post : cette carte n'est plus dans la main
    mutating func envoyerCarte (c : String, m : mainProtocol)

    
    // nbCarteRoyaume : Royaume -> Int
    // pré : royaume est de type Royaume
    func nbCarteRoyaume () -> Int  


    // décrireRoyaume : Royaume -> Carte
    // fonction permettant de savoir ce qu'on a dans le royaume, c'est à dire le rôle de carte (Archer, Soldat...) et leurs nombres
    func decrireRoyaume () -> [carteProtocol]
    
    
    // retirerRoyaume : Royaume x Carte -> Royaume
    // fonction permetant de retirer une carte du royaume 
    // pré : carte est de type carte et elle doit etre présente dans le royaume
    mutating func retirerRoyaume (c : carteProtocol)
    
    
    // estDansRoyaume : Royaume x Carte -> Bool 
    // fonction renvoyant True si la carte rentrée en paramètre est dans le royaume et False sinon 
    // pré : il faut que la carte existe, rentrer le bon type de carte
    func estDansRoyaume (c : carteProtocol) -> Bool

    // derniereCarte : Royaume -> Carte
    // fonction renvoyant la derniere carte rentrée dans le royaume
    // Pre : r est de type royaume
    // Resultat : est de type Carte
    func derniereCarte() -> carteProtocol

    // premiereCarte : Royaume -> Carte
    // fonction renvoyant la carte la plus ancienne du royaume 
    // Pre : r est de type royaume
    // Resultat : est de type Carte
    func premiereCarte() -> carteProtocol

}
