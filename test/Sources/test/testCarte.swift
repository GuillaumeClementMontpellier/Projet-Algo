// test carte

import class

// test fonction changerMode : 

public func testCreationcarte(r : String, j : Int){
	print("test creation d'une carte")
	var c = Carte(role : r, joueur : j)
	if c.role() != r{
		print("La carte est du bon role")
	}
	else {
		print("erreur la carte n'a pas le bon role")
	}
	if !c.estOffensive() {
		print("la carte est initialisé avec le bon mode")
	}
	else {
		print("erreur la carte n'a pas le bon mode")
	}
	var ca = Carte(role : "rien", joueur : 1)
	if isKindOf(ca,Vide){
		print("la création a bien echoué")
	}
	else{
		print("erreur lors le la crétion d'une carte avec un role n'existant pas")
	}
}

public func testchangerMode(){
	print ("test changerMode()")
	var ca = Carte(role : "rien", joueur : 1)
	ca.changerMode()
	if !ca.estOffensive(){
		print ("Erreur : la carte est initialisé en position defensive donc doit etre en offensice")
	}
	else {
		print ("La fonction marche")
	}
}

// test fonction estOffensive : 

public func testestOffensive() {
	print("test estOffensive()")
	c = Carte(role : r, joueur : j)
	if !c.estOffensive() {
		print("la fonction marche")
	}
	else {
		print("erreur")
	}
	ca.changerMode()
	if !ca.estOffensive(){
		print ("Erreur : la carte est initialisé en position defensive donc doit etre en offensive")
	}
	else {
		print ("La fonction marche")
	}
}

public func testposition(c : Carte){
	print("test position")
	var pos = c.postion()
	if pos.carte() == c {
		print("OK")
	}
	else {
		print("Erreur ne renvoie pas la bonne position")
	}
}


public func testchangerPosition(c : Carte){
	print("test changerPosition()")
	var pos = Position(n : "A1")
	c.changerPosition(p : pos)
	if c.position == pos {
		print("OK")
	}
	else {
		print("Erreur ne change pas la position")
	}
}

public func testvaleurAttaqueDefense(){
	print("test valeurAttaque()")
	var c = Carte(role : "Archer", joueur : 1)
	if c.valeurAttaque() == 1{
		print("ok")
	}
	else {
		print("erreur n'affiche pas la bonne valeur")
	}
	if (c.valeurDefense() == 2 && !c.estOffensive()) || (c.valeurDefense() == 1 && c.estOffensive()) {
		print("ok")
	}
	else {
		print("erreur n'affiche pas la bonne valeur")
	}
}

public func testpointdegat() {
	print("test pointDegat()")
	var c = Carte(role : "Archer", joueur : 1)
	if c.pointDegat(t : 1) == 0{
		print("ok")
	}
	else {
		print("erreur n'affiche pas les bon degats")
	}
}

public func testajoutpointDegat(){
	print("test ajoutpointDegat()")
	var c = Carte(role : "Archer", joueur : 1)
	c.ajoutDegat(d : 1, t : 1)
	if c.pointDegat(t : 1) == 1{
		print("ok")
	}
	else {
		print("erreur n'augmente pas les degats")
	}
}

public func testroleCarte(){
	print("test roleCarte()")
	var c = Carte(role : "Archer", joueur : 1)
	if c.roleCarte == "Archer" {
		print("ok")
	}
	else {
		print("erreur n'affiche pas le bon role")
	}
}

public func testjoueur(){
	print("test joueur()")
	var c = Carte(role : "Roi", joueur : 1)
	if c.joueur() == 1 {
		print("ok")
	}
	else {
		print("n'affiche pas le bon numero")
	}
	var ca = Carte(role : "Roi", joueur : 2)
	if ca.joueur() == 2 {
		print("ok")
	}
	else {
		print("n'affiche pas le bon numero")
	}
}





// Main

testCreationcarte(r : "Archer", j : 1)
testchangerMode()
testestOffensive()
testvaleurAttaqueDefense()
testpointdegat()
testajoutpointDegat()
testroleCarte()
testjoueur()
