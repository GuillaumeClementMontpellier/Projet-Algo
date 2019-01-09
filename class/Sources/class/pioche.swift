
import prot

import Foundation

class pioche : piocheProtocol {
    
    typealias mainProtocol = main
    typealias royaumeProtocol = leroyaume

    var liste : [carte]

    required init?(j : Int){
        
        self.liste = []
        
        for _ in 1...9{
if let c = carte(role : "Soldat", joueur : j){
            self.liste.append(c)
        }
}

        for _ in 1...6{
if let c = carte(role : "Garde", joueur : j){
            self.liste.append(c)
        }
}

        for _ in 1...5{
if let c = carte(role : "Archer", joueur : j){
            self.liste.append(c)
        }
}


        self.liste.shuffle()
    }

    //piocher a faire (pour le royaume puis pour la main)

    func piocher(lieu : main, nb : Int){ 
	// pré : il faut que la pioche soit non vide
	// pré : il faut que l'entier rentré en paramètre doit etre soit 1 soit 3
        // post : il faut enlever la carte de la pioche une fois qu'elle est piochée
        //      : la carte enlevée de la pioche doit etre ajouté dans la main et le nb de role de cette carte doit etre incrémenter dans la main

        lieu.liste.append(self.liste[0])

        self.liste.remove(at : 0)        
    }
    
    func piocher(lieu : leroyaume, nb : Int){
    // pré : il faut que la pioche soit non vide
    // pré : il faut que l'entier rentrée en paramètre doit etre soit 1 soit 3
    // post : il faut enlever la carte de la pioche une fois qu'elle est piochée
    //      : la carte enlevée de la pioche doit etre ajouté dans le Royaume

        lieu.listeCartes.append(self.liste[0])

        self.liste.remove(at : 0)
    }

    func nbCartePioche() -> Int {
        return self.liste.count
    }

    func estVidePioche() -> Bool {
        return nbCartePioche() == 0
    }

    

}
