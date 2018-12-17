
class carte : carteProtocol {

    typealias champs_de_bataille = champsdebatailleProtocol
    typealias royaume = royaumeProtocol
    typealias main = mainProtocol
    typealias position = positionProtocol

    var cdb : champs_de_bataille?
    var roy : royaume?
    var hand : main?
    var pos : position?

    var mode : Bool // true si la carte est offensive, false sinon
    
    var att : Int{ //valeur d'attaque
        get{
            if self.role == "Soldat"{
                throw Erreur // pas de moyen d'acceder au nbr de cartes dans la main du joueur
            }else{
                return 1
            }
        }
    }
    
    var def : Int{ //valeur de defense
        get{
            if self.mode {
                switch self.role{
                case "Roi" :
                    return 4
                case "Garde" :
                    return 2
                default :
                    return 1
                }
            } else {
                switch self.role{
                case "Roi" :
                    if self.joueur == 1{
                        return 4
                    } else {
                        return 5
                    }
                case "Garde" :
                    return 3
                default :
                    return 2
                }
            }
        }
    }
    
    var joueur : int

    var role : String

    var ptDegat : [Int]

    init?(role : String, joueur : int){
        //verifie les préconditions
        if joueur != 1 and joueur != 2 {
            return nil
        }
        // verifie les preconditions 2
        if role != "Archer" and role != "Garde" and role != "Roi" and role != "Soldat" {
            return nil
        }
        // init()

        self.role = role
        self.joueur = joueur
        self.mode = true
        self.ptDegat = [0]
        
    }

    func changerMode(){
        self.mode = !(self.mode)
    }

    func estOffensive() -> Bool{
        return self.mode
    }

    func position()-> position {
        if let pos = self.pos {
            return pos
        }else {
            throw Erreur
        }
    }
    
    func changerPosition (p : position){
        self.pos = p
    }
    
    func valeurAttaque() -> Int{
        return self.att
    }
    
    func valeurDefense() -> Int{
        return self.def
    }
    
    func pointDegat(t : Int) -> Int {
        
        while (t >= self.ptDegat.count){
            self.ptDegat.append(0)
        }
        
        return self.ptDegat[t]
        
    }
    
    func ajoutPointDegat(d : Int, t : Int){
        var a : Int = pointDegat(t : t)
        self.ptDegat[t] = a + d
    }

    func roleCarte() -> String {
        return self.role
    }

    // Peut attaquer et capturer

    func cdb () -> champs_de_bataille{

    }

    
}
