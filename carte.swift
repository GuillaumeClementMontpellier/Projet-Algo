
class carte : carteProtocol {

    typealias champs_de_bataille = champsdebatailleProtocol
    typealias royaume = royaumeProtocol
    typealias main = mainProtocol
    typealias position = positionProtocol

    private var cdb : champs_de_bataille?
    private var roy : royaume?
    private var hand : main?
    private var pos : position?

    private var mode : Bool // true si la carte est offensive, false sinon
    
    private var att : Int{ //valeur d'attaque
        get{
            if self.role == "Soldat"{
                throw Erreur // pas de moyen d'acceder au nbr de cartes dans la main du joueur
            }else{
                return 1
            }
        }
    }
    
    private var def : Int{ //valeur de defense
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
    
    private var joueur : int

    private var role : String

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
        
    }

    
}
