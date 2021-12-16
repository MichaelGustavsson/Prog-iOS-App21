import UIKit

/* Classes And Structs */
// Swift säger följande: Använd Struct framför Classes.
// Struct stöder allt som en klass gör och kan förutom arv.
// Behöver vi arv så använder vi klasser.

// Enums (Enumerations)
enum FuelType{
    case diesel
    case bensin
    case hybrid
    case elektrisk
    case gas
}

enum GearType{
    case manuell
    case Automat
    case Steptronic
}

// Klasser...
class Vehicle {
    // Klasser kan innehålla egenskaper och metoder
    // Egenskaper
    var regNumber : String
    var mileage : Int
    var make : String
    var model : String
    var fuelType: FuelType
    var gearType: GearType
    
    // I andra språk kallas detta för Constructor...
    init(registrationNumber: String, mileage: Int, make: String, model: String, fuelType: FuelType, gearType: GearType){
        self.regNumber = registrationNumber
        self.mileage = mileage
        self.make = make
        self.model = model
        
        // Skapa logik som kontrollerar om bränsle eller växellåda existerar
        self.fuelType = fuelType
        self.gearType = gearType
    }
    
    // I andra språk kallas detta för Destructors
    deinit{
        // Här kan vi städa upp resurser som vi använt som inte Swift själv automatisk kan städa upp.
    }
    
    // Metoder
    func displayVehicleInfo(){
        print("RegNummer: \(regNumber) Bilmärke: \(make)")
    }
}

// Instantiering av ett objekt sker utan nyckelordet "new".
var car = Vehicle(registrationNumber: "ABC123", mileage: 25000, make: "Volvo", model: "XC40",
                  fuelType: .diesel, gearType: .Automat)

car.displayVehicleInfo()

print("Bränsletyp = \(car.fuelType)")
print("Registeringsnummer är \(car.regNumber) antal körda km \(car.mileage)")

enum Betyg{
    case ett
    case två
    case tre
    case fyra
    case fem
}
// Structs...
struct Movie {
    // Structs kan innehålla egenskaper och metoder.
    // Egenskaper...
    var title: String = ""
    var length: Int = 0
    var director: String = ""
    var actors: [String] = []
    var genre: String = "Drama"
    var betyg: Betyg = .tre
    
    // Dummy Init!?!
//    init(){
//        self.title = ""
//    }
//    init(title: String){
//        self.title = title
//    }
    // Metoder
    func createMovie(){
        print("New movie Spiderman")
    }
    
    func showMovieInfo(whichMovie: String){
        // REST API anrop för att hämta filmen...
    }
    
}

var movie = Movie()
movie.title = "Dark night rises"
movie.length = 180
movie.director = "Christopher Nolan"
movie.actors = [""]

movie.createMovie()

print(movie.actors)
