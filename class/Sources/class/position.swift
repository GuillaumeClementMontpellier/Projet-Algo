
import prot

import Foundation

class position : positionProtocol {
    
associatedtype carteProtocol = carte
associatedtype champsdebatailleProtocol = champs_de_bataille
    

    var nomPos : String
    var cddb : champs_de_bataille
    var cartee : carte?

    init(n : String, cdb : champs_de_bataille){
        self.nomPos = n
        self.cddb = cdb
    }

    func estVide() -> Bool{
        if let c = self.carte(){
            return false
        }
        else{
            return true
        }
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

    func cdb() -> champs_de_bataille{
        return self.cddb
    }
          
}
    
