//: [Previous](@previous)

import Foundation

struct Manufacturor: Hashable{
    var name: String
    var logoImage: String
    var vehiclesInStock: Int
    
    init(manufacturorName: String, logoImage: String, inStock: Int){
        self.name = manufacturorName
        self.logoImage = logoImage
        self.vehiclesInStock = inStock
    }
}

// Sets -> lagrar distinkta värden eller objekt
// Tillåter inte dubbletter...

var manufacturorsSet = Set<Manufacturor>()
//var manufacturorsSet: Set = ["Volvo","Ford","Kia"]

// Addera en tillverkare
manufacturorsSet.insert(Manufacturor(manufacturorName: "Volvo", logoImage: "volvo.jpg", inStock: 4))
manufacturorsSet.insert(Manufacturor(manufacturorName: "Kia", logoImage: "kia.jpg", inStock: 4))
manufacturorsSet.insert(Manufacturor(manufacturorName: "BMW", logoImage: "bmw.jpg", inStock: 4))
manufacturorsSet.insert(Manufacturor(manufacturorName: "Volvo", logoImage: "volvo.jpg", inStock: 4))

//print(manufacturorsSet)

// Iterera igenom
for make in manufacturorsSet{
    print(make)
}

print(manufacturorsSet.contains(where: {$0.name == "Kia"}))


//var vehicles: [String] = ["Volvo", "Ford", "Volkswagen", "Volvo", "Mercedes", "Ford"]
//
//print(vehicles)
//
//
//var distinctVehicles = Set<String>()
//distinctVehicles = Set(vehicles.map{$0})
//
//print(distinctVehicles)

//: [Next](@next)
