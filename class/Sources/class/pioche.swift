
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

    func nbCartePioche() -> Int {
        return self.liste.count
    }

    func estVidePioche() -> Bool {
        return nbCartePioche() == 0
    }

    

}
