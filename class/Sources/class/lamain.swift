
import prot

import Foundation

class main : mainProtocol {
    
typealias champsdebatailleProtocol = champs_de_bataille
typealias positionProtocol = position
typealias carteProtocol = carte

    var liste : [carte]
    
    var champ : champs_de_bataille
    
    init?(num : Int){
        
        if num != 1 && num != 2 {
            return nil
        }
        
        self.liste = []

        if let c =  carte(role : "Roi", joueur : num) {
            
            self.liste.append(c)

        }
        
    }

    func nbDeCarteMain() -> Int{
        return self.liste.count
    }

    func poserCarte(cdb : champs_de_bataille, c : String, pos : position){
	// pré : il faut que c le role la carte existe dans la main
	// pré : il faut que le joueur ai la carte dans sa main 
	// pré : il faut que le String corresponde a un role d'une carte (Archer, soldat ....)
        var i : Int = 0
        var fait : Bool = false // pour verifier qu'on ne pose qu'une carte
        while (i < self.liste.count && !fait){

            if self.liste[i].roleCarte() == c {
                
                var b : Bool = true // pour verifier qu'on ne pose la carte qu'une fois

                for p in cdb.champ {
                    if p === pos && b{
                        p.carte = self.liste[i]
                        self.liste.remove(at : i)
                        b = false
                    }
                }
                
                fait = true
            }            
            i+=1
        }
    }

    func listeCarteMain() -> [carte]{
        return self.liste
    }

    func ajouterCarteMain(c : carte){

        if let pos = c.pos{
        
        pos.carte = nil
        c.pos = nil
        self.liste.append(c)

        }
    
    }
        

    func avoirMain(r : String) -> Bool{
        var rep : Bool = false
        for c in self.liste{
            if c.roleCarte() == r{
                rep = true
            }
        }

        return rep
    }

}
