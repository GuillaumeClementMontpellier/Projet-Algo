// test champs de bataille

import classe

import Foundation

// test ajouterUneCarte :

public func testajouterUneCarte (p : Position, c : Carte) {
    print("test ajouterUneCarte()")
    var avmain : [Carte] = listeCarteMain()
    ajouterUneCarte (p : p, c : c)
    var apmain : [Carte] = listeCarteMain()
    if avmain.count == apmain.count+1{
        print("la carte a bien été retiré de la main du joueur")
    }
    else {
        print("Erreur : la carte n'a pas été retiré de la main")
    }
    if !estVidePosition(p : p){
        print("la carte a bien été posé sur le champs de bataille à la position demandée")
    }
    else {
        print("Erreur : la carte ne s'est pas posée sur la position demandé")
    }
}


// test fonction supprimerCarte : 

public func testsupprimerCarte (p : Position, c : Carte){
    print("test supprimerCarte()")
    if !estVidePosition (p : p) {
        var carte : Carte = obtenirCarte (p : p)
        supprimerCarte (p : p)
        if estVidePosition (p :p){
            print("La carte a bien été supprimer de la position")
        }
        else {
            print("Erreur : La carte n'a pas été supprimée")
        }
        if carte == derniereCarte(){
            print("La carte a bien été envoyé dans le royaume")
        }
        else {
            print("Erreur : La carte n'a pas été envoyée dans le royaume")
        }
        
    }
}

// test fonction avancerCarte :

public func testavancerCarte (p: Position){
    print("test avancerCarte()")
    if p.arriere() {
        var carte : Carte = cdb.obtenirCarte(p : p)
        avanverCarte(p : p)
        for i in cdb.position(){
            if p.nom(i) == "F1"{
                if carte.position().nom() == "A1"{
                    print(" la carte a bien été avancée")
                }
                else {
                    print("Erreur : la carte n'a pas été avancée")
                }
            }
            if p.nom(i) == "F2"{
                if carte.position().nom() == "A2"{
                    print(" la carte a bien été avancée")
                }
                else {
                    print("Erreur : la carte n'a pas été avancée")
                }
            }
            if p.nom(i) == "F1"{
                if carte.position().nom() == "A1"{
                    print(" la carte a bien été avancée")
                }
                else {
                    print("Erreur : la carte n'a pas été avancée")
                }
            }
        }
    }
}


// test fonction estVide : 
public func testestVide(cdb : Champsdebataille) {
    print("test estVide()")
    var cdb : Champsdebataille
    if cdb.estVide() {
        for i in cdb {  // i prend toutes les positions du champs de bataille une par une 
            if !estVidePosition(i){
                print("Erreur : la fonction estVide() ne vérifie pas si le champs de bataille est vide")
            }
            else {
                print("la fonction estVide() vérifie bien que le champs de bataille est vide")
            }
        }
    }
}


// test fonction estVidePosition : 
public func testestVidePosition(p : Position){
    var cdb : Champsdebataille
    if cdb.estVide() {
        for i in cdb {  // i prend toutes les positions du champs de bataille une par une 
            if !estVidePosition(i){
                print("Erreur : la fonction estVidePosition() ne vérifie pas si la position est vide")
            }
            else {
                print("la fonction estVidePosition() vérifie bien que la position est vide")
            }
        }
    }
}

// test fonction cimetiere : 
public func testCimetiere (c : Carte, p : Position ) {
    var carte : Carte = cdb.obtenirCarte(p : p)
    cimetiere (c : c, p : p)
    if cdb.obtenirCarte(p : p) == carte {
        print("Erreur, la carte n'a pas été supprimer du champs de bataille")
    }
    else {
    	print("La carte a bien été envoyée au cimetière") 
    }
}


// test fonction position : 

public func testPosition (cdb : Champsdebataille) {
    var position : [Position] = cdb.position() 
    var tab : [String] = ["F1","F2","F3","A1","A2","A3"]
    if len(position) != 6 {
       	print("Erreur : le tableau obtenu n'est pas le tableau des positions du champs de bataille")
    }
    else {
       	for i in range (tab.count){
            if tab[i] != position(p.nom(i)){
                print("Erreur : le tableau obtenu n'est pas le tableau des positions du champs de bataille")
            }
            else {
                print("La fonction renvoyé bien un tabbleau avec toutes les positions du champs de bataille")
            }
        }
    }
}






