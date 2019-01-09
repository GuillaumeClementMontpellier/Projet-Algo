
import prot

import Foundation

class le_champs_de_bataille : champsdebatailleProtocol {
    
typealias positionProtocol = laposition
typealias carteProtocol = carte
typealias royaumeProtocol = leroyaume
typealias mainProtocol = main

    var champ : [laposition]
    var proprietaire  : Int
    var roy : leroyaume //Royaume du joueur possédant le champ de bataille
    var main : main // la main du joueur qui possede le champ de bataille
    
    required init(j : Int, r : leroyaume, m : main){

        self.proprietaire = j

        self.roy = r

        self.main = m

        self.champ = []
        
        self.champ.append(laposition(n : "A1", cdb : self))
        self.champ.append(laposition(n : "A2", cdb : self))
        self.champ.append(laposition(n : "A3", cdb : self))
        self.champ.append(laposition(n : "F1", cdb : self))
        self.champ.append(laposition(n : "F2", cdb : self))
        self.champ.append(laposition(n : "F3", cdb : self))
    }
        
    func ajouterUneCarte(p : laposition, c : carte){
        //vérifie si dans la carte est dans la main du joueur
        if let m = c.main() {
            if c.joueur() == self.proprietaire{
                
                //vérfie si il y a déjà une carte sur la position
                if let ca = p.carte(){
                    m.ajouterCarteMain(c : ca)
                    p.cartee = nil
                }
                c.pos = p
                
                //supprime la carte de la main
                m.poserCarte(cdb : self, c : c.roleCarte(), pos : p)
            }
        }
    }

    func supprimerCarte(c : carte){
        //on verifie que la carte est sur le champ de bataille
        if let cdb = c.cdb() {
            if (cdb === self){
                c.cddb = nil
            }
        }
    }

    func estVidePosition(p : laposition) -> Bool{
        return p.estVide()
    }

    func avancerCarte(p : laposition){
        if self.estVidePosition(p : p) && p.front(){
            if (p.nom() == "F1"){
                if let carte = self.champ[3].carte(){
                    carte.pos = p
                }
            }
            else if (p.nom() == "F2"){
                if let carte = self.champ[4].carte(){
                     carte.pos = p
                }
            }
            else if (p.nom() == "F3"){
                if let carte = self.champ[5].carte(){
                    carte.pos = p
                }
            }
        }
    }
    
    
    func estVide() -> Bool{
        var b : Bool = true
        var cpt : Int = 0
        while (b && cpt<6){
            b = self.estVidePosition(p : self.champ[cpt])
            cpt += 1
        }
        return b
    }
    
    func position() -> [laposition]{
        return self.champ
    }
    
    func obtenirCarte(p : laposition) -> carte{
        if let c = p.carte(){
            return c
        } else{
            fatalError("PAS DE CARTE")
        }
    }
    
    func royaume() -> leroyaume{
        return self.roy
    }
    
    func cimetiere(c : carte){
        if let pos = c.pos{
            pos.cartee = nil
            c.pos = nil
        }
    }
    
    //place la carte la plus ancienne du royaume sur le champ de bataille (conscription)
    func envoyerCarte(p : laposition){
        let it : Itroyaume = self.roy.makeItRoyaume()
        if let c = it.next(){
            c.changerPosition(p : p)
            self.roy.retirerRoyaume(c : c)
        }
    }
}
