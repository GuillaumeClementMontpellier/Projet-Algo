
import prot

import Foundation

class carte : carteProtocol {
    
typealias champsdebatailleProtocol = champs_de_bataille
typealias royaumeProtocol = royaume
typealias mainProtocol = main
typealias positionProtocol = position

    var cdb : champs_de_bataille?
    var roy : royaume?
    var hand : main?
    var pos : position?

    var mode : Bool // true si la carte est offensive, false sinon
    
    var att : Int{ //valeur d'attaque
        get{
            if self.role == "Soldat"{
                return self.cdb.main.nbDeCarteMain() // pas de moyen d'acceder au nbr de cartes dans la main du joueur
            }else{
                return 1
            }
        }
    }
    
    var def : Int{ //valeur de defense
        get{
            if self.mode {
                switch self.role{
                case "Roi" :
                    return 4
                case "Garde" :
                    return 2
                default :
                    return 1
                }
            } else {
                switch self.role{
                case "Roi" :
                    if self.joeur == 1{
                        return 4
                    } else {
                        return 5
                    }
                case "Garde" :
                    return 3
                default :
                    return 2
                }
            }
        }
    }
    
    var joeur : Int

    var role : String

    var ptDegat : [Int]
    
    var portee : [String]{
    
        get{
            var rep : [String] = []

            if let pos = self.pos{
            
                switch self.role {
                
                case "Roi":
                    if pos.arriere(){
                        if self.joeur == 1{
                            if pos.nom() == "A1" {
                                rep.append("F1")
                            }else if pos.nom() == "A2"{
                                rep.append("F2")
                            } else { // en A3
                                rep.append("F3")
                            }
                        }
                    }else{ // au front
                        rep.append("F1")
                        rep.append("F2")
                        rep.append("F3")
                        if self.joeur == 1{
                            if pos.nom() == "F1" {
                                rep.append("A1")
                            }else if pos.nom() == "F2"{
                                rep.append("A2")
                            } else { // en F3
                                rep.append("A3")
                            }
                        }
                    }
                case "Archer":
                    switch pos.nom() {
                    case "F1":
                        rep.append("A2")
                        rep.append("F3")
                    case "F2":
                        rep.append("A1")
                        rep.append("A3")
                    case "F3":
                        rep.append("F1")
                        rep.append("A2")
                    case "A2":
                        rep.append("F1")
                        rep.append("F3")
                    default: // A1 ou A3 (même chose)
                        rep.append("F2")
                    }
                    
                    default: // soldat ou Garde
                        if pos.front(){
                            if pos.nom() == "F1"{
                                rep.append("F1")
                            } else if pos.nom() == "F2"{
                                rep.append("F2")
                            } else { // en F3
                                rep.append("F3")
                            }
                        }
                        
                }
            }
            return rep
        }
    }

    init?(role : String, joueur : Int){
        //verifie les préconditions
        if joueur != 1 && joueur != 2 {
            return nil
        }
        // verifie les preconditions 2
        if role != "Archer" && role != "Garde" && role != "Roi" && role != "Soldat" {
            return nil
        }
        // init()

        self.role = role
        self.joeur = joueur
        self.mode = true
        self.ptDegat = [0]
        
    }

    func changerMode(){
        self.mode = !(self.mode)
    }

    func estOffensive() -> Bool{
        return self.mode
    }

    func position() throws -> position{
        if let pos = self.pos {
            return pos
        }else {
            throw Error
        }
    }
    
    func changerPosition (p : position){
        self.pos = p
    }
    
    func valeurAttaque() -> Int{
        return self.att
    }
    
    func valeurDefense() -> Int{
        return self.def
    }
    
    func pointDegat(t : Int) -> Int {
        
        while (t >= self.ptDegat.count){
            self.ptDegat.append(0)
        }
        
        return self.ptDegat[t]
        
    }
    
    func ajoutPointDegat(d : Int, t : Int){
        let a : Int = pointDegat(t : t)
        self.ptDegat[t] = a + d
    }

    func roleCarte() -> String {
        return self.role
    }

    // PeutAttaquer et capturer
    func peutAttaquer(c : carte) -> Bool{
        if !self.estOffensive(){
            return false
        } else {
            var s = self.att
            var rep :Bool = false
            for nom in s {
                if nom == c.pos.nom() {
                    rep = true
                }
            }
            
            return rep
        }
    }
    
    func capturerCarte(attaquant : carte){ //still to do
    	self.joeur = attaquant.joueur()

    	if let cdb = attaquant.cdb{
            if let pos = self.pos {
    	        self.cdb = nil
    	        pos.carte = nil
    	        self.pos = nil
    	        self.roy = cdb.roy
    	        cdb.roy.listeCartes.append(self)
            }
    	}
    }

    func cdb () -> champs_de_bataille? {
        return self.cdb
    }

    func royaume () -> royaume? {
        return self.roy
    }
    
    func main () -> main? {
        return self.hand
    }

    func joueur () -> Int {
        return self.joeur
    }
    
}
