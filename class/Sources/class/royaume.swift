
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

    func envoyerCarte(c : String, m : main){
	    var b : Bool = true
	    var i : Int = 0
	    while (i<=m.liste.count and !b){
		    if (m.liste[i].role == c){
      			m.liste[i].hand=nil
        		m.liste[i].roy=self
        		self.listeCartes.append(m.liste[i])
			    b = true
		    }
	    i=i+1
	    }	
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
