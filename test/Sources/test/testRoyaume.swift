//: Playground - noun: a place where people can play

import classe

import Foundation

// test fonction nbCarteRoyaume 

public func testnbCarteRoyaume (r : Royaume) {
    print("test nbCarteRoyaume()")
    cpt = 0
    for i in r {
        cpt += 1
        if cpt == nbCarteRoyaume (r){
            print("la fonction nbCarteRoyaume() fonctionne correctement")
        }
        else {
            print("Erreur : la fonction nbCarteRoyaume() ne fonctionne pas")
        }
    }
}


// test fonction envoyerCarte () :

public func testenvoyerCarte (r : Royaume, c : String, m : Main){ // test pour verifier si on ajoute bien la carte dans le royaume
    print ("test envoyerCarte()")
    if m.nbCartemain() == 0 {
        print ("Erreur")
    }
    else {
        avRoyaume = nbCarteRoyaume(r)
        envoyerCarte(r, m)
        apRoyaume = nbCarteRoyaume(r)
        if avRoyaume == apRoyaume {
            print("Erreur : La fonction n'ajoute pas la carte comme souhaité")
        }
        else if apRoyaume == avRoyaume+1 {
            print("La fonction ajoute correctement la carte")
        }
        else {
            print("Erreur : le nombre de carte avRoyaume et apRoyaume est anormal.")
        }
        for j in m {
            if dernier.decrireRoyaume(r) == j {
                print ("Erreur : la carte n'a pas été enlevée de la main")
            }
            else {
                print ("La carte a bien été enlevée de la main")
            }
        }
    }
}

// test fonction decrireRoyaume : 

public func testdecrireRoyaume (r : royaume){
    print("test decrireRoyaume()")
    var tab1 : [Carte]
    var tab2 : [Carte] = decrireRoyaume(r)
    for i in r {
        tab.append(i)
    }
    for j in range (count.tab){
        if tab1[i] != tab2[i]{
            print("Erreur : la fonction decrireRoyaume() ne décrit pas le royaume comme il faut")
        }
        else {
            print("la fonction decrireRoyaume() fonctionne correctement")
        }
    }
}

// test fonction retirerRoyaume : 

public func testretirerRoyaume ( r : Royaume, c : Carte) {
    print("test retirerRoyaume()")
    var avtab : [Carte] = decrireRoyaume(r : r)
    var r1 : Royaume = retirerRoyaume(c : c)
    var aptab : [Carte] = decrireRoyaume(r : r1)
    if count.avtab == count.aptab+1 {
        print("La fonction retirerRoyaume() enlève bien une carte dans le royaume")
    }
    else {
        print("Erreur : la fonction retirerRoyaume() ne fonctionne pas")
    }
}

// test fonction estDansRoyaume : 

public func testestDansRoyaume (r : Royaume, c : Carte){
    print("test estDansRoyaume()")
    var tab : [Carte] = decrireRoyaume(r : r)
    for i in tab {
        if i == estDansRoyaume(c : c){
            print("la fonction estDansRoyaume() permet bien de vérifier si une carte est dans le royaume")
        }
        else {
            print("Erreur : la fonction estDansRoyaume() ne fonctionne pas")
        }
    }
}


// test fonction derniereCarte :

public func testderniereCarte (r : Royaume) {
    print("test derniereCarte()")
    var tab : [Carte] = decrireRoyaume(r : r)
    var n : Int = count.tab
    if tab[n] == derniereCarte(){
        print("La fonction derniereCarte() renvoit bien la derniere carte presente dans le royaume")
    }
    else {
        print( "Erreur : la fonction derniereCarte() ne fonctionne pas")
    }
}

// test fonction premiereCarte :

public func testpremiereCarte (r : Royaume) {
    print("test premiereCarte()")
    var tab : [Carte] = decrireRoyaume(r : r)
    if tab[0] == derniereCarte(){
        print("La fonction premiereCarte() renvoit bien la premiere carte presente dans le royaume")
    }
    else {
        print( "Erreur : la fonction premiereCarte() ne fonctionne pas")
    }
}

