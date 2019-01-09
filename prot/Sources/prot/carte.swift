import Foundation

// ---------------------- type CARTE -------------------

// Carte a un role parmi {Roi , Soldat, Garde, Archer}, chaque role correspond a des parametre defenie par le jeu

protocol carteProtocol  {
    
associatedtype champsdebatailleProtocol
associatedtype royaumeProtocol
associatedtype mainProtocol
associatedtype positionProtocol
    
    
 
	// init : String x Int -> (Self|Vide)
	// création d'une carte a partir de son role
	// Pre : role est "Archer" ou "Garde" ou "Soldat" ou "Roi". Chaque role correspond a valeur d'attaque, de defense, de portée ... definie par le jeu donc il suffit juste de savoir le role de la carte 
	//	   : joueur correspond au numéro du joueur : 1 ou 2 (servira uniquement pour differencier les deux Roi (lors de leur création dans le type Main et pour savoir à quel joueur appartient la carte))
	//	   : par default le mode de la carte s'initialise defensive car lorque une carte est posé sur le terrain est elle en mode defensive
	// sinon la creation échoue (renvoie Vide)
	 init?(role : String, joueur : Int)

	// changerMode : Carte ->
	// fonction changeant le mode de jeu de la carte : de défensive a offensive OU de offensive a defensive
	// Pre : c doit être de type Carte 
	// Post : le mode de la carte doit avoir changé
	 mutating func changerMode()  

	// estOffensive : Carte -> Bool
	// fonction retournant true si la Carte est en postion Offensive, false sinon
	// Pre : c doit être de type Carte 
	 func estOffensive() -> Bool  

	// position : Carte -> Position
	// fonction retourant la position d'une carte sur le champs de bataille
	// Pre : c doit etre une carte et cette carte doit etre sur le champs de bataille
	// Resultat : la position est renvoyé sous forme : F1, ... , A3 
	 func position() -> positionProtocol

	// changerPosition : Carte x Position ->
	// fonction changeant la postion(placement sur le champs de bataille) de la Carte c
	// Pre :c doit etre une Carte
	mutating func changerPosition(p : positionProtocol)

	// valeurAttaque : Carte -> Int
	// fonction renvoyant la valeur de l'attaque de la carte c pour son role
	// Pre : c doit etre de type Carte
	func valeurAttaque() -> Int  

	// valeurDefense : Carte -> Int
	// fonction renvoyant la valeur de la defense de la carte c pour son role
	// Pre : c doit etre de type Carte
	func valeurDefense() -> Int  

	// pointDegat : Carte x Int -> Int 
	// fonction renvoyant le nombre de point de degats que la carte a enregistré durant le tour actuel
	// Pre : c doit etre de type Carte
	func pointDegat(t : Int)  -> Int

	// ajoutPointDegat : Carte x Int x Int ->
	// fonction ajoutant la valeur d aux points de degats de la cible c
	// Pre : c et a doivent etre de type Carte
	mutating func ajoutPointDegat(d : Int, t : Int)   

	// roleCarte : Carte -> String 
	// fonction permettant de savoir le role d'une carte
	// Pre : c doit etre de type Carte 
	func roleCarte() -> String  

	// peutAttaquer : carte x Carte -> Bool
	// fonction renvoyant true si la carte attaquante a peut attaquer la carte cible c (elle peut si elle n'a pas deja attaqué(pas deja en mode offensif) et que sa portée le lui permet (suivant son role))
	// Pre : c et a doivent etre de type Carte
	func peutAttaquer(c : carteProtocol) -> Bool

	// capturerCarte : Carte x Carte ->
	// fonction capurant la carte lors d'une attaque, la fonction envoie  la carte dans le royaume de l'adversaire (c'est donc l'adversaire qui possedera la carte)
	// Pre : c doit etre de type Carte et a est l acarte qui attaque (permet d'acceder a son royaume)
	mutating func capturerCarte(attaquant : Carte)

	// cdb : Carte -> (ChampDeBataille|Vide)
	// fonction retournant le champs de bataille sur lequel la carte est posée
	// Pre : cette carte doit etre sur un champs de bataille
	// Resultat : c est de type ChampDeBataille
	func cdb() -> champsdebatailleProtocol?

	// royaume : Carte -> (Royaume|Vide)
	// fonction retourant le royaume dans lequel est la carte
	// Pre : la carte doit etre dans un royaume
	// Resultat : r est de type Royaume
    func royaume() -> royaumeProtocol?

	// main : Carte -> (Main|Vide)
	//fonction retournant la main dans laquelle est la Carte
	// Pre : la carte doit etre dans une main
	// Resultat : m est de type main
	func main() -> mainProtocol?

	// joueur : Carte -> Int
	// fonction retournant le numero du joueur possédant carte, cette fonction servira uniquement pour pouvoir differencier les deux Roi (pour savoir leur caractéristique lors d'une action)
	// Pre : la carte doit etre de type Carte et doit avoir comme role Roi
	// Resultat : le numero du joueur ayant ce Roi (1 ou 2)
	func joueur() -> Int  
}


