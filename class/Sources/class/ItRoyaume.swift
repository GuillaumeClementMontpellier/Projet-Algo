
import prot

import Foundation

class ItRoyaume : IteratorProtocol {
    
    typealias royaume = royaumeProtocol
    
    var roy : Royaume
    var courant : Int
    
    init(r : royaume){
        self.roy = r
        self.courant = 0
    }
    
    mutating func next() -> carte?{
        if self.courant>self.roy.listeCartes.count{
            return nil
        }
        else{
            var x : Int = self.courant
            self.courant = self.courant + 1
            return self.roy.listeCartes[x]
            }
    }
    

}
