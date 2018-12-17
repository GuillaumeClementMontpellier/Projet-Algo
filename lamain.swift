

class main : mainProtocol {

    typealias champs_de_bataille = champdebatailleProtocol
    typealias position = positionProtocol
    typealias carte = carteProtocol

    var liste : [carte]
    
    init?(num : Int){

        if num != 1 and num != 2 {
            return nil
        }
        
        self.liste = []
            
        self.liste.append(carte(role : "Roi", joueur : num))
        
    }

    func nbDeCarteMain() -> Int{
        return self.liste.count()
    }

    //poserCarte a faire
    func poserCarte(cdb : champs_de_bataille, c : String, pos : position){
	// pré : il faut que c le role la carte existe dans la main
	// pré : il faut que le joueur ai la carte dans sa main 
	// pré : il faut que le String corresponde a un role d'une carte (Archer, soldat ....)
        var i : Int = 0
        var fait : Bool : false
        while (i < self.liste.count and !fait){

            if self.liste[i].roleCarte() == c {

                //TODO
                
                
                fait = true
            }            
            i+=1
        }
    }

    func listeCarteMain() -> [carte]{
        return self.liste
    }

    //ajouterCarteMain a faire
        

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
