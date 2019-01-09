
import class

import Foundation

// test fonction piocher : 
public func testPiocher(p : Pioche, n : Int){
    print ("test piocher()")
    if n =< 0 {
        print ("Erreur : l'entier rentré doit être strictement positif")
    }
    avPioche = nbCartePioche(p)
    piocher(p)
    ApPioche = nbCartePioche(p)
    if avPioche == apPioche {
        print("Erreur : La fonction ne retire pas la carte comme souhaité")
    }
    if avPioche == apPioche+1 {
        print("La fonction retire correctement la carte")
    }
    else {
        print("Erreur : le nombre de carte Pioche1 et Pioche2 est anormal.")
    }
}

// test fonction estVidePioche : 
public func testestVidePioche (p : Pioche){
    print ("test estVidePioche()")
    if nbCartePioche (p) == 0 {
        if estVidePioche(p){
            print ("la fonction estVidePioche() fonctionne")
        }
        else {
            print ("Erreur : la fonction estVidePioche() ne fonctionne pas")
    }
}
}

// test fonction nbCartePioche : 
public func testnbCartePioche (p: Pioche){
    print ("test nbCartePioche()")
    cpt = 0
    for  i in p {
        cpt += 1
    }
    if cpt == nbCartePioche(p){
        print ("la fonction nbCartePioche() fonctionne correctement ")
    }
    else {
            print("Erreur : la fonction nbCartePioche()")
    }
}

var pio : Pioche = Pioche()

testPiocher(p : pio, n : 1)
testestVidePioche (p : pio)
testnbCartePioche (p: pio)
