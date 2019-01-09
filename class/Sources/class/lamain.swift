
import prot

class main : mainProtocol {

    typealias champs_de_bataille = champdebatailleProtocol
    typealias position = positionProtocol
    typealias carte = carteProtocol

    var liste : [carte]
    
    var champ : champs_de_bataille
    
    init?(num : Int){
        
        if num != 1 && num != 2 {
            return nil
        }
        
        self.liste = []
            
        self.liste.append(carte(role : "Roi", joueur : num))
        
    }

    func nbDeCarteMain() -> Int{
        return self.liste.count()
    }

    func poserCarte(cdb : champs_de_bataille, c : String, pos : position){
	// pré : il faut que c le role la carte existe dans la main
	// pré : il faut que le joueur ai la carte dans sa main 
	// pré : il faut que le String corresponde a un role d'une carte (Archer, soldat ....)
        var i : Int = 0
        var fait : Bool = false // pour verifier qu'on ne pose qu'une carte
        while (i < self.liste.count && !fait){

            if self.liste[i].roleCarte() == c {
                
                var b : bool = true // pour verifier qu'on ne pose la carte qu'une fois

                for p in cdb.champ {
                    if p == pos && b{
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

    func ajouterCartemain(c : carte){
    
        c.pos.carte = nil
        c.pos = nil
        self.liste.append(c)
    
    }
        

    func avoirMain(r : String){
        var rep : Bool = false
        for c in self.liste{
            if c.roleCarte() == r{
                rep = true
            }
        }

        return rep
    }

}
