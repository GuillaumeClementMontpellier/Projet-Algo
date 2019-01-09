
import prot

import Foundation

class champs_de_bataille : champsdebatailleProtocol {
    
typealias positionProtocol = position
typealias carteProtocol = carte
typealias royaumeProtocol = royaume


    var champ : [position]
    var proprietaire  : Int
    var roy : royaume //Royaume du joueur possédant le champ de bataille
    var main : main // la main du joueur qui possede le champ de bataille
    
    init(){
        
        self.champ = [position(n : "A1", cdb : self),  position(n : "A2", cdb : self), position(n : "A3", cdb : self), position(n : "F1", cdb : self), position(n : "F2", cdb : self), position(n : "F3", cdb : self)]
        //init du royaume ? de la main ?
    }
        
    func ajouterUneCarte(p : position, c : carte){
        //vérifie si dans la carte est dans la main du joueur
        if let m = c.main() {
            if c.joueur() == self.proprietaire{
                
                //vérfie si il y a déjà une carte sur la position
                if let c = p.carte(){
                    m.ajouterCarteMain(c : p.carte)
                    p.carte = nil
                }
                c.pos = p
                
                //supprime la carte de la main
                m.poserCarte(cdb : self, c : c.roleCarte(), pos : p)
            }
        }
    }

    func supprimerCarte(c : carte){
        //on verifie que la carte est sur le champ de bataille
        if let cdb = c.cdb{
            if (cdb === self){
                c.cdb = nil
            }
        }
    }

    func estVidePosition(p : position) -> Bool{
        return p.estVide()
    }

    func avancerCarte(p : position){
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
    }

    func estVide() -> Bool{
        var b : Bool = true
        var cpt : Int = 0
        while (b && cpt<6){
            b = estVidePosition(p : self.champ[cpt])
        }
        return b
    }

    func position() -> [position]{
        return self.champ
    }

    func obtenirCarte(p : position) -> carte{
        if let c = p.carte(){
            return c
        }
    }

    func royaume() -> royaume{
        return self.roy
    }

    func cimetiere(c : carte){
        if let pos = c.pos{
            pos.carte = nil
            c.pos = nil
        }
    }

    //place la carte la plus ancienne du royaume sur le champ de bataille (conscription)
    func envoyerCarte(p : position){
        var it : ItRoyaume = self.roy.makeIterator()
        if let c = it.next(){
            c.changerPosition(p : p)
            self.roy.retirerRoyaume(c : c)
        }
    }
