import Foundation

import classe

// carte

testCreationcarte(r : "Archer", j : 1)
testchangerMode()
testestOffensive()
testvaleurAttaqueDefense()
testpointdegat()
testajoutpointDegat()
testroleCarte()
testjoueur()

// CBD

var main : Main = Main(num : 1)
var cdb : Champsdebataille = Champsdebataille ()
var posf : Position = Position(nom : "F1")
var posa : Position = Position(nom : "A1")
var c : Carte = Carte(role : r, joueur : j)

testajouterUneCarte(p : posa, c : c)
testsupprimerCarte(p : posf, c : c)
poserCarte(p : posa,c : c)
testavancerCarte (p : posa)
testavancerCarte(p : posf)
testestVide(cdb : cdb)
testestVidePosition(p : posa)
testestVidePosition(p : posf)
testCimetiere(c : c,p : posa)
testPosition(cdb : cdb)

// main

testnbCarteMain(m : main)
testposerCarte(cdb : cdb, c : c, p : posf)
testlisteCarteMain(m : main)

// pioche

var pio : Pioche = Pioche()

testPiocher(p : pio, n : 1)
testestVidePioche (p : pio)
testnbCartePioche (p: pio)

//Position 


testestVide(p : posa)
testnom(p : posa)
testFront(p : posa)
testFront(p : posf)
testArriere(p : posa)
testArriere(p : posf)

//Royaume

var roy : Royaume = Royaume()

testnbCarteRoyaume (r : Royaume)
testenvoyerCarte (r : roy, c : "Roi1", m : main)
envoyerCarte(r : roy, c : "Roi1", m : main)
testdecrireRoyaume (r : roy)
testestDansRoyaume (r : roy, c : c)
testderniereCarte (r : roy)
testpremiereCarte (r : roy)



