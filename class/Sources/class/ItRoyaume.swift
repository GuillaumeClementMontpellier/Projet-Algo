
import prot

import Foundation

public class Itroyaume : ItRoyaume {
    

    public typealias royaumeProtocol = leroyaume
    public typealias carteProtocol = carte
    
    
    public var roy : leroyaume
    public var courant : Int
    
    public required init(r : leroyaume){
        self.roy = r
        self.courant = 0
    }
    
    public func next() -> carte?{
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
