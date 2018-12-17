// test Position 

// test fonction estVide :

public func testestVide(p : Position){
	print ("test estVide()")
	var cdb : Champsdebataille
	if p.estVide() == cdb.estVidePosition (p : p) {
		print ("La fonction renvoit bien True si la position rentrée en paramètre est vide")
	}
	else {
		print ("Erreur : la fonction ")
	}
}


// test fonction nom :
public func testnom(p : Position){
	var cpt : Int = 1
	var tab : [String] = ["F1","F2","F3","A1","A2","A3"]
	for i in tab {
		if tab[i] == p.nom(p : p){
			cpt = 0
		}
		if cpt == 0 {
			print ("La fonction permet bien de renvoyer le bom de la position prise en paramètre sous forme de string")			
		}
		else {
			print ("Erreur : la fonction ne renvoit pas la position prise en paramètre sous forme de String")
		}
	}
}


// test fonction front :
public func testFront (p : Position){
	print("test front()")
	if p.front(){
		if (p.nom() == "F1" || p.nom() == "F2" || p.nom() == "F3") {
			print (" La fonction front() vérifie bien que la position prise en paramètre est située sur le front du champs de bataille")
		}
		else {
			print (" Erreur : la fonction renvoit true même si la position n'est pas sur la ligne de front")
		}
	}
} 

// test fonction arriere :
public func testArriere (p : Position){
	print("test arriere()")
	if p.arriere(){
		if (p.nom() == "A1" || p.nom() == "A2" || p.nom() == "A3") {
			print (" La fonction arriere() vérifie bien que la position prise en paramètre est située à l'arriere du champs de bataille")
		}
		else {
			print (" Erreur : la fonction renvoit true même si la position n'est pas sur la ligne arriere")
		}
	}
}




var posf = Position(nom : "F1")
var posa = Position(nom : "A1")



testestVide(p : posa)
testnom(p : posa)
testFront(p : posa)
testFront(p : posf)
testArriere(p : posa)
testArriere(p : posf)








