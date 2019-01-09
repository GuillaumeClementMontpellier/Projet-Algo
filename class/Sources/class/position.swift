
import prot

import Foundation

class laposition : positionProtocol {
    
typealias carteProtocol = carte
typealias champsdebatailleProtocol = le_champs_de_bataille
    

    var nomPos : String
    var cddb : le_champs_de_bataille
    var cartee : carte?

    required init(n : String, cdb : le_champs_de_bataille){
        self.nomPos = n
        self.cddb = cdb
    }

    func estVide() -> Bool{
        return self.cartee == nil
    }

    func nom() -> String{
        return self.nomPos
    }

    func carte() -> carte?{
        return self.cartee
    }

    func front() -> Bool{
        return (self.nomPos == "F1" || self.nomPos == "F2" || self.nomPos == "F3")
    }

    func arriere() -> Bool{
        return (self.nomPos == "A1" || self.nomPos == "A2" || self.nomPos == "A3")
    }

    func cdb() -> le_champs_de_bataille{
        return self.cddb
    }
          
}
    
