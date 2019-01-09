// test lamain 

import class

import Foundation

// test fonction nbCarteMain : 

public func testnbCarteMain(m : Main){
	print ("test nbCarteMain()")
	var main : [Carte] = listeCarteMain()
	if main.count == nbCarteMain(){
		print ("la fonction nbCarteMain() renvoit bien le bon nombre de carte dans la main")
	}
	else {
		print ("Erreur : la fonction nbCarteMain() ne renvoit pas le bon nombre de carte dans la main")
	}
}

// test fonction poserCarte : 

public func testposerCarte(cdb : Champsdebataille, c : Carte, p : Position) {
	print ("test poserCarte()")
	var avmain : [Carte] = listeCarteMain()
	var position : Bool = estVidePosition()
	if !position {
		var type : Carte = p.obtenirCarte()
	}
	poserCarte()
	var apmain : [Carte] = listeCarteMain()
	if avmain.count == apmain.count+1 {
		print ("la carte a bien été retirée de la main")
	}
	else {
		print ("Erreur : la carte n'a pas été retirée de la main")
	}
	if position {
		if p.estVidePosition(){
			print ("Erreur : la carte n'a pas été posé à la position demandée")
		}
		else {
			print ("la carte a bien été posée à la position demandée")
		}
	}
	if !position {
		if type == p.obtenirCarte(){
			print ("la carte déjà présente n'a pas été remplacé par la carte appelé en paramètre")
		}
		else {
			print ("la carte déjà présente a bien été remplacée")
		}
	}
}

// test fonction listeCarteMain :
public func testlisteCarteMain(m : Main){
	print ("test listeCarteMain()")
	var main1 : [Carte] = []
	for i in m {
		main1.append(i)
	}
	var main2 : [Carte] = listeCarteMain()
	if main1.count == main2.count{
		for j in range (main1.count) {
			if main1[j] != main2[j] {
				print ("Erreur : la fonction listeCarteMain() ne renvoit pas les cartes de la main du joueur")
			} 
			else {
				print ("la fonction listeCarteMain() renvoit bien les cartes présentent dans la main")
			}
		}
	}
	else {
		print ("Erreur : la fonction listeCarteMain() ne renvoit pas les cartes de la main du joueur")
	}
}

var main : Main = Main(num : 1)
var cdb : Champsdebataille = Champsdebataille ()
var posf : Position = Position(nom : "F1")
var posa : Position = Position(nom : "A1")
var c : Carte = Carte(role : r, joueur : j)

testnbCarteMain(m : main)
testposerCarte(cdb : cdb, c : c, p : posf)
testlisteCarteMain(m : main)
