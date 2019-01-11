
import prot

import Foundation

public class lamain : mainProtocol {
    
    public typealias champsdebatailleProtocol = le_champs_de_bataille
    public typealias positionProtocol = laposition
    public typealias carteProtocol = carte
    
    public var liste : [carte]
    
    public required init?(num : Int){
        
        if num != 1 && num != 2 {
            return nil
        }
        
        self.liste = []
        
        if let c =  carte(role : "Roi", joueur : num) {
            
            self.liste.append(c)
            
        }
        
    }

    public func nbDeCarteMain() -> Int{
        return self.liste.count
    }

    public func poserCarte(cdb : le_champs_de_bataille, c : String, pos : laposition){ 
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

                        if let ca = p.carte(){

                            self.ajouterCarteMain(c : ca)

                        }
                        
                        self.liste[i].cddb = cdb
                        self.liste[i].pos = p
                        p.cartee = self.liste[i]
                        self.liste.remove(at : i)
                        b = false
                    }
                }
                
                fait = true
            }            
            i+=1
        }
    }

    public func listeCarteMain() -> [carte]{
        return self.liste
    }

    public func ajouterCarteMain(c : carte){

        if let pos = c.pos{
        
            pos.cartee = nil
            c.pos = nil
            c.cddb = nil
            self.liste.append(c)

        }
    
    }
        

    public func avoirMain(r : String) -> Bool{
        var rep : Bool = false
        for c in self.liste{
            if c.roleCarte() == r{
                rep = true
            }
        }

        return rep
    }

}
