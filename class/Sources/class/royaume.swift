
import prot

import Foundation

class royaume : royaumeProtocol {

    typealias carteProtocol = carte
    typealias mainProtocol = main
    typealias ItRoyaume = Itroyaume

    var listeCartes : [carte]

    required init(){
        self.listeCartes = []
    }


    func makeItRoyaume() -> Itroyaume{
        return makeIterator()
    }

    func makeIterator() -> Itroyaume{
        return Itroyaume(r : self)
    }

    func envoyerCarte(c : String, m : main){ // il faut rechercher une carte correspondante dans la main, puis l'envoyer dans le royaume
        //c.hand=nil
        //c.roy=self
        //self.listeCartes.append(c)
    }
    
    func nbCarteRoyaume() -> Int{
        return self.listeCartes.count
    }
    
    func decrireRoyaume() -> [carte]{
        return self.listeCartes
    }
    
    func retirerRoyaume(c : carte){
        var i : Int = 0
        while (i < self.listeCartes.count) && (self.listeCartes[i] !== c) {
            i = i+1
        }
        self.listeCartes.remove(at : i)
    }
    
    func estDansRoyaume(c : carte) -> Bool{
        var b : Bool = false
        var i : Int = 0
        
        while i<self.listeCartes.count && !b{
            if self.listeCartes[i] === c{
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
