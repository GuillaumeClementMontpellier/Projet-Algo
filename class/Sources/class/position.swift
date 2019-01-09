
import prot

import Foundation

public class laposition : positionProtocol {
    
public typealias carteProtocol = carte
public typealias champsdebatailleProtocol = le_champs_de_bataille
    

    public var nomPos : String
    public var cddb : le_champs_de_bataille
    public var cartee : carte?

    public required init(n : String, cdb : le_champs_de_bataille){
        self.nomPos = n
        self.cddb = cdb
    }

    public func estVide() -> Bool{
        return self.cartee == nil
    }

    public func nom() -> String{
        return self.nomPos
    }

    public func carte() -> carte?{
        return self.cartee
    }

    public func front() -> Bool{
        return (self.nomPos == "F1" || self.nomPos == "F2" || self.nomPos == "F3")
    }

    public func arriere() -> Bool{
        return (self.nomPos == "A1" || self.nomPos == "A2" || self.nomPos == "A3")
    }

    public func cdb() -> le_champs_de_bataille{
        return self.cddb
    }
          
}
    
