
import prot

import Foundation

class Itroyaume : ItRoyaume {
    

    typealias royaumeProtocol = leroyaume
    typealias carteProtocol = carte
    
    
    var roy : leroyaume
    var courant : Int
    
    required init(r : leroyaume){
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
