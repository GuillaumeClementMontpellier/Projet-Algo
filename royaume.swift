class royaume : royaumeProtocol {

    typealias carte = carteProtocol
    typealias main = mainProtocol
    typealias ItRoyaume = IteratorProtocol

    var listeCartes : [carte]

    init(){
        self.listeCartes = []
    }

    func makeItRoyaume() -> ItRoyaume{
        return ItRoyaume(self)
    }
