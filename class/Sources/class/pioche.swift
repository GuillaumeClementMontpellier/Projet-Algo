
import prot

import Foundation

class pioche : piocheProtocol {
    
    typealias mainProtocol = main
    typealias royaumeProtocol = royaume

    var liste : [carte]

    init?(j : Int){
        
        self.liste = []
        
        for i in 1...9{
            self.liste.append(carte(role : "Soldat", joueur : j))
        }

        for i in 1...6{
            self.liste.append(carte(role : "Garde", joueur : j))
        }

        for i in 1...5{
            self.liste.append(carte(role : "Archer", joueur : j))
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
    
    func piocher(lieu : royaume, nb : Int){
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
