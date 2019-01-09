
import prot

import Foundation

public class leroyaume : royaumeProtocol {

    public typealias carteProtocol = carte
    public typealias mainProtocol = lamain
    public typealias ItRoyaume = Itroyaume

    public var listeCartes : [carte]

    public required init(){
        self.listeCartes = []
    }


    public func makeItRoyaume() -> Itroyaume{
        return makeIterator()
    }

    public func makeIterator() -> Itroyaume{
        return Itroyaume(r : self)
    }

    public func envoyerCarte(c : String, m : lamain){
	    var b : Bool = true
	    var i : Int = 0
	    while (i <= m.liste.count) && !b {
		    if (m.liste[i].role == c){
      			m.liste[i].hand=nil
        		m.liste[i].roy=self
        		self.listeCartes.append(m.liste[i])
			b = true
		    }
	    i=i+1
	    }	
    }
    
    public func nbCarteRoyaume() -> Int{
        return self.listeCartes.count
    }
    
    public func decrireRoyaume() -> [carte]{
        return self.listeCartes
    }
    
    public func retirerRoyaume(c : carte){
        var i : Int = 0
        while (i < self.listeCartes.count) && (self.listeCartes[i] !== c) {
            i = i+1
        }
        self.listeCartes.remove(at : i)
    }
    
    public func estDansRoyaume(c : carte) -> Bool{
        var b : Bool = false
        let i : Int = 0
        
        while i<self.listeCartes.count && !b{
            if self.listeCartes[i] === c{
                b = true
            }
        }
        return b
    }
    
    public func derniereCarte() -> carte{
        return self.listeCartes[self.listeCartes.count-1]
    }
    
    public func premiereCarte() -> carte{
        return self.listeCartes[0]
    }
}
