
import prot

import Foundation

class Itroyaume : ItRoyaume {
    

    associatedtype royaumeProtocol = royaume
    associatedtype carteProtocol = carte
    
    
    var roy : royaume
    var courant : Int
    
    required init(r : royaume){
        self.roy = r
        self.courant = 0
    }
    
    func next() -> carte?{
        if self.courant>self.roy.listeCartes.count{
            return nil
        }
        else{
            let x : Int = self.courant
            self.courant = self.courant + 1
            return self.roy.listeCartes[x]
            }
    }
    

}
