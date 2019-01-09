
import prot

import Foundation

class royaume : royaumeProtocol {

    typealias carte = carteProtocol
    typealias main = mainProtocol
    typealias ItRoyaume = IteratorProtocol

    var listeCartes : [carte]

    init(){
        self.listeCartes = []
    }

    func makeItRoyaume() -> ItRoyaume{
        return ItRoyaume(self)
    }

    func envoyerCarte(c : carte, m : main){
        c.hand=nil
        c.roy=self
        self.listeCartes.append(c)
    }
    
    func nbCarteRoyaume() -> Int{
        return self.listeCartes.count
    }
    
    func decrireRoyaume() -> [carte]{
        return self.listeCartes
    }
    
    func retirerRoyaume(c : carte){
        var i : Int = 0
        while i<self.listeCartes.count && self.listeCartes[i]!=c{
            i = i+1
        }
        self.listeCartes.remove(at : i)
    }
    
    func estDansRoyaume(c : carte) -> Bool{
        var b : Bool = False
        var i : Int = 0
        
        while i<self.listeCartes.count && !b{
            if self.listeCartes[i] = c{
                b = true
            }
        }
        return b
    }
    
    func derniereCarte() -> carte{
        return self.listeCartes[self.listeCartes.count-1]
    }
    
    func premiereCarte() -> carte{
        return self.listeCartes[0]
    }
}
