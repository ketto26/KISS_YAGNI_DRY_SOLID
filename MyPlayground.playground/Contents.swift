import Foundation



 print(String(repeating: "-", count: 45), "TASK 1", String(repeating: "-", count: 45))

protocol Cannons {
    var cannonsCount: Int { get set }
    func firingCannons(count: Int)
}

class PirateShip: Cannons {
    var cannonsCount: Int
    let name: String
    var cargoMeneger: CargoManaging
    var crewMeneger: CrewManager
    
    init(name: String, cargoMeneger: CargoManaging, crewMeneger: CrewManager, cannonCount: Int) {
        self.name = name
        self.cargoMeneger = cargoMeneger
        self.crewMeneger = crewMeneger
        self.cannonsCount = cannonCount
    }
    
    func firingCannons(count: Int) {
        self.cannonsCount -= count
        print("Ship \(self.name) fired \(count) times! Cannons left: \(self.cannonsCount).")
    }
}

class Frigate: PirateShip {
    private var shipColor: String
    
    init(shipColor: String, name: String, cargoMeneger: CargoManaging, crewMeneger: CrewManager, cannonCount: Int) {
        self.shipColor = shipColor
        super.init(name: name, cargoMeneger: cargoMeneger, crewMeneger: crewMeneger, cannonCount: cannonCount)
    }
}

class Galleon: PirateShip {
    private var shipSize: Double
    
    init(shipSize: Double, name: String, cargoMeneger: CargoManaging, crewMeneger: CrewManager, cannonCount: Int) {
        self.shipSize = shipSize
        super.init(name: name, cargoMeneger: cargoMeneger, crewMeneger: crewMeneger, cannonCount: cannonCount)
    }
}


protocol CargoManaging {
    var cargo: [String] { get set }
    
    func addCargo(cargoItem: String)
    func removeCargo(cargoItem: String)
    func listCargo()
}

class CargoManager: CargoManaging {
    var cargo: [String]
    
    init(cargo: [String]) {
        self.cargo = cargo
    }
    
    func addCargo(cargoItem: String) {
        cargo.append(cargoItem)
    }
    
    func removeCargo(cargoItem: String) {
        cargo.removeAll(where: { $0 == cargoItem })
    }
    
    func listCargo() {
        print("Items left in cargo")
        for item in cargo {
            print(item)
        }
    }
}


protocol CrewMeneging {
    var crew: [String] { get set }
    
    func addCrew(crewMember: String)
    func removeCrew(crewMember: String)
    func listCrew()
}

class CrewManager: CrewMeneging {
    var crew: [String]
    
    init(crew: [String]) {
        self.crew = crew
    }
    
    func addCrew(crewMember: String) {
        crew.append(crewMember)
    }
    
    func removeCrew(crewMember: String) {
        crew.removeAll(where: { $0 == crewMember })
    }
    
    func listCrew() {
        print("Crew members:")
        for member in crew {
            print(member)
        }
    }
}


print(String(repeating: "-", count: 45), "TASK 2", String(repeating: "-", count: 45))


class TreasureMap {
    private var x: Double
    private var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure() {
        if self.x == 48.19156 {
            if self.y == 16.38348 {
                print("You got it! One piece is yours!!🎉")
            } else if self.y > 16.38348 {
                print("X is good! Take lower Y.")
            } else {
                print("X is good! Take higher Y.")
            }
        } else if x > 48.19156 {
            if self.y == 16.38348 {
                print("Take lower X. Y is good!")
            } else if self.y > 16.38348 {
                print("Take lower X and Y")
            } else {
                print("Take lower X and higher Y.")
            }
        } else {
            if self.y == 16.38348 {
                print("Take lower X. Y is good!")
            } else if self.y > 16.38348 {
                print("Take higher X and lower Y")
            } else {
                print("Take higher X and Y.")
            }
        }
    }
}


print(String(repeating: "-", count: 45), "TASK 3", String(repeating: "-", count: 45))


class SeaAdventure {
    var adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("Pirates came across adventure: \(adventureType)!")
    }
}


print(String(repeating: "-", count: 45), "TASK 4", String(repeating: "-", count: 45))


class PirateCode {
    var pirateMotto: String
    
    init(pirateMotto: String) {
        self.pirateMotto = pirateMotto
    }
    
    func parley() {
        print("Pirates choose parley!")
    }
    
    func mutiny() {
        print("Real pirates choice is mutiny!")
    }
    
    private func discussTerms(term: String) {
        print("The discussion started about \(term)!")
        if term == pirateMotto{
            self.parley()
        } else {
            self.mutiny()
        }
    }
}


print(String(repeating: "-", count: 45), "TASK 5", String(repeating: "-", count: 45))


var crew = CrewManager(crew: ["Monkey D. Luffy", "Roronoa Zoro", "Nami", "Usopp", "Vinsmoke Sanji", "Tony Tony Chopper", "Nico Robin", "Franky", "Brook", "Jinbe"])

var cargo = CargoManager(cargo: ["Meat Meat Meat", "Rice", "Sea king meat", "Orange", "Fish", "Cotton Candy", "Chocolate", "Tea", "Cola", "Hidden gold from Nami", "musical instruments"])

let sunny = PirateShip(name: "Sunny", cargoMeneger: cargo, crewMeneger: crew, cannonCount: 10000)
// They don't need that much cannons but still.. 😆

let mugiwaraMotto = PirateCode(pirateMotto: "Kai zoku o ni ore wa na ru")

var mugiwaraAdventures = SeaAdventure(adventureType: "Flying Dutchman")

var startCoordinates = TreasureMap(x: 25.34563, y: 17.35678)
startCoordinates.hintToTreasure()

startCoordinates = TreasureMap(x: 52.78645, y: 13.45673)
startCoordinates.hintToTreasure()

startCoordinates = TreasureMap(x: 48.19156, y: 16.38348)
startCoordinates.hintToTreasure()

//Just for fun -->
mugiwaraAdventures.encounter()

mugiwaraMotto.mutiny()

sunny.firingCannons(count: 30)
