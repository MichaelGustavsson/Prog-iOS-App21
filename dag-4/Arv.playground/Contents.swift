import Foundation

// Base class eller Super class
// Här placeras generella egenskaper/tillstånd och generell funktionalitet
class Vehicle{
    var id: Int = 0
    var make: String = ""
    var model: String = ""
    
    func brake(){
        print("Jag bromsar")
    }
    
    func info(){
        print("Detta kommer ifrån Vehicle klassen")
    }
}

// Barn klasser
// Specifika egenskaper/tillstånd och specifik funktionalitet
class Car : Vehicle{
    var mileage: Int = 0
    var fuelType: String = ""
    
    override func brake() {
        print("Trampar på bromsen, ABS fungerar hurra!")
    }
}

class RacingCar: Car{
    var maxSpeed: Int = 0
    
    override func brake() {
        super.brake()
    }
    override func info() {
        print("Du är i en racer bil!!!")
    }
}

class Bike : Vehicle{
    var frameSize: String = "26 tum"
    
    override func info() {
        print("Du är miljövänlig")
    }
}

//var volvo = Car()
//volvo.brake()
//volvo.info()
//
//var crescent = Bike()
//crescent.brake()
//crescent.info()
//
//var racing = RacingCar()
//racing.brake()
//racing.info()


struct Animal{
    var name: String = ""
    
    func displayAnimal(){
        print("Djuret heter \(name)")
    }
}

// Struct stöder inte arv...
//struct Dog : Vehicle{
//
//}

var dog = Animal()
dog.name = "Fido"

dog.displayAnimal()


