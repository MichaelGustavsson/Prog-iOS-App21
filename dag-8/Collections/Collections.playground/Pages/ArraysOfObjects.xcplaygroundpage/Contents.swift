//: [Previous](@previous)

import Foundation

struct Manufacturor{
    var name: String
    var logoImage: String
    var vehiclesInStock: Int
    
    init(manufacturorName: String, logoImage: String, inStock: Int){
        self.name = manufacturorName
        self.logoImage = logoImage
        self.vehiclesInStock = inStock
    }
}

var manufacturors: [Manufacturor] = []

if manufacturors.isEmpty {
    print("Manufacturors är tom")
}

manufacturors.append(Manufacturor(manufacturorName: "Volvo", logoImage: "volvo.jpg", inStock: 4))
manufacturors.append(Manufacturor(manufacturorName: "Kia", logoImage: "kia.jpg", inStock: 2))
manufacturors.append(Manufacturor(manufacturorName: "BMW", logoImage: "bmw.jpg", inStock: 3))

if !manufacturors.isEmpty {
    print("Manufacturors är inte tom")
}

//print(manufacturors)

// Steg 1. generera ett index/offset och element par
// Steg 2. Söka ut ett specifikt objekt med dess manufacturorName
// Steg 3. Returnera en array av index som vi förhoppningsvis hittat

let index = manufacturors.enumerated().filter{$0.element.name == "Volvo"}.map{$0.offset}

print(index[0])

let makeToRemove = manufacturors.remove(at: index[0])

print(makeToRemove)
print(manufacturors)

manufacturors.insert(makeToRemove, at: index[0])

print(manufacturors)

// En enklare variant att göra samma sak på!!!
// Sätt 1. Coalesce (??)
let idx1 = manufacturors.firstIndex(where: {$0.name == "Mercedes"}) ?? 0

// Sätt 2.
if let idx2 = manufacturors.firstIndex(where: {$0.name == "Kia"}){
    print("idx2 = \(idx2)")
}else{
    print("Hittade ingen tillverkare")
}

// Sätt 3.
func getManufacturor(){
    guard let idx3 = manufacturors.firstIndex(where: {$0.name == "Kia"}) else {
        return
    }
    
    print("idx3 = \(idx3)")
    
    // ... mer kod som skall köras...
}
        
print(idx1)

getManufacturor()












//: [Next](@next)
