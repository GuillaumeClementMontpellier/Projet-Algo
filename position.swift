class position : positionProtocol {
    
    typealias carte = carteProtocol
    typealias champs_de_bataille = champsdebatailleProtocol

    var nomPos : String
    var cdb : champs_de_bataille
    var carte : carte?

    init(n : String, cdb : champs_de_bataille){
        self.nomPos = n
        self.cdb = cdb
    }

    func estVide() -> Bool{
        if let c = self.carte(){
            return false
        }
        else{
            return true
        }
    }

    func nom() -> String{
        return this.nomPos
    }

    func carte() -> carte?{
        return self.carte
    }

    func front() -> Bool{
        return (self.nomPos == "F1" || self.nomPos == "F2" || self.nomPos == "F3")
    }

    func arriere() -> Bool{
        return (self.nomPos == "A1" || self.nomPos == "A2" || self.nomPos == "A3")
    }

    func cdb() -> champs_de_bataille{
        return self.cdb
    }
          
        
    
